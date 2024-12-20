-- +goose Up
-- +goose StatementBegin
CREATE TYPE payment_frequency AS ENUM ('week', 'month', 'day');

CREATE TABLE membership_plans (
    id UUID DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    price BIGINT NOT NULL,
    membership_id UUID NOT NULL,
    payment_frequency payment_frequency,
    amt_periods INT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, membership_id),
    CONSTRAINT fk_membership
        FOREIGN KEY(membership_id) 
        REFERENCES memberships(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS membership_plans;
DROP TYPE IF EXISTS payment_frequency;
-- +goose StatementEnd