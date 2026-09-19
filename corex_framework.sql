-- COREX Framework — Database Schema
-- Imported automatically by txAdmin during deployment.

CREATE TABLE IF NOT EXISTS `players` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(60) NOT NULL,
    `name` VARCHAR(50) NOT NULL DEFAULT 'Unknown',
    `money` LONGTEXT NOT NULL,
    `metadata` LONGTEXT NOT NULL,
    `save_revision` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier` (`identifier`),
    KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Compatibility identity aliases for QBCore, Qbox, and ESX projections.
CREATE TABLE IF NOT EXISTS `corex_identity_aliases` (
    `corex_player_id` VARCHAR(128) NOT NULL,
    `alias_kind` VARCHAR(32) NOT NULL,
    `alias_value` VARCHAR(128) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`corex_player_id`, `alias_kind`),
    UNIQUE KEY `uq_corex_identity_alias` (`alias_kind`, `alias_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Namespaced framework-only player data (jobs, gangs, charinfo, variables).
CREATE TABLE IF NOT EXISTS `corex_compat_data` (
    `corex_player_id` VARCHAR(128) NOT NULL,
    `namespace` VARCHAR(64) NOT NULL,
    `data_key` VARCHAR(64) NOT NULL,
    `data_value` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`corex_player_id`, `namespace`, `data_key`),
    CONSTRAINT `chk_corex_compat_data_json` CHECK (JSON_VALID(`data_value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `corex_inventories` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(60) NOT NULL,
    `inventory_type` VARCHAR(50) NOT NULL DEFAULT 'player',
    `inventory_id` VARCHAR(60) NOT NULL,
    `items` LONGTEXT NOT NULL,
    `hotbar` LONGTEXT NOT NULL,
    `save_revision` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_inventory` (`identifier`, `inventory_type`, `inventory_id`),
    KEY `idx_inventory_lookup` (`identifier`, `inventory_type`),
    KEY `idx_inventory_id` (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
