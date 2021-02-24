SELECT
  coalesce(
    json_agg(
      "root"
      ORDER BY
        "root.pg.is_book_it_now" DESC NULLS LAST,
        "root.pg.updated_on" DESC NULLS LAST
    ),
    '[]'
  ) AS "root"
FROM
  (
    SELECT
      "_1_root.base"."updated_on" AS "root.pg.updated_on",
      "_1_root.base"."is_book_it_now" AS "root.pg.is_book_it_now",
      row_to_json(
        (
          SELECT
            "_8_e"
          FROM
            (
              SELECT
                "_1_root.base"."id" AS "id",
                "_1_root.base"."updated_on" AS "updatedOn",
                "_1_root.base"."trip_distance" AS "tripDistance",
                "_1_root.base"."terms_and_conditions_id" AS "termsAndConditionsId",
                "_1_root.base"."special_info" AS "specialInfo",
                "_1_root.base"."quantity" AS "quantity",
                "_1_root.base"."posted_rate" AS "postedRate",
                "_1_root.base"."post_as_user_id" AS "postAsUserId",
                "_7_root.or.postAsUser"."postAsUser" AS "postAsUser",
                "_1_root.base"."piece_count" AS "pieceCount",
                "_1_root.base"."pallet_count" AS "palletCount",
                "_1_root.base"."origin_earlytime" AS "originEarlyTime",
                "_1_root.base"."origin_latetime" AS "originLateTime",
                "_1_root.base"."origin_city" AS "originCity",
                "_1_root.base"."origin_state" AS "originState",
                "_1_root.base"."origin_zipcode" AS "originZipCode",
                "_1_root.base"."origin_country" AS "originCountry",
                "_1_root.base"."origin_deadhead" AS "originDeadhead",
                "_1_root.base"."origin_city_state" AS "originCityState",
                "_1_root.base"."mode_code" AS "modeCode",
                "_1_root.base"."mode_id" AS "modeId",
                "_1_root.base"."load_tracking_required" AS "loadTrackingRequired",
                "_1_root.base"."additional_load_stops" AS "additionalLoadStops",
                "_1_root.base"."load_state_id" AS "loadStateId",
                "_1_root.base"."load_action_id" AS "loadActionId",
                "_1_root.base"."legacy_load_id" AS "legacyLoadId",
                "_1_root.base"."is_book_it_now" AS "isBookItNow",
                "_1_root.base"."equipment_id" AS "equipmentId",
                "_1_root.base"."equipment_options" AS "equipmentOptions",
                "_1_root.base"."equipment_code" AS "equipmentCode",
                "_1_root.base"."equipment_name" AS "equipmentName",
                "_1_root.base"."dimensions_cube" AS "dimensionsCube",
                "_1_root.base"."dimensions_weight" AS "dimensionsWeight",
                "_1_root.base"."dimensions_length" AS "dimensionsLength",
                "_1_root.base"."dimensions_height" AS "dimensionsHeight",
                "_1_root.base"."destination_earlytime" AS "destinationEarlyTime",
                "_1_root.base"."destination_deadhead" AS "destinationDeadhead",
                "_1_root.base"."destination_city_state" AS "destinationCityState",
                "_1_root.base"."destination_city" AS "destinationCity",
                "_1_root.base"."destination_state" AS "destinationState",
                "_1_root.base"."destination_latetime" AS "destinationLateTime",
                "_1_root.base"."destination_country" AS "destinationCountry",
                "_1_root.base"."destination_zipcode" AS "destinationZipCode",
                "_1_root.base"."custom_data" AS "customData",
                "_1_root.base"."created_on" AS "createdOn",
                "_1_root.base"."commodity_description" AS "commodityDescription",
                "_1_root.base"."commodity_id" AS "commodityId",
                "_1_root.base"."all_in_rate" AS "allInRate",
                "public"."can_book_it_now"(
                  "_1_root.base",
                  ('3a236353-b055-e911-aa1e-b0e52ccc70f6') :: uuid
                ) AS "canBookItNow",
                "_1_root.base"."rpm" AS "rpm",
                "_4_root.or.brokerProfile"."brokerProfile" AS "brokerProfile",
                'loads' AS "__typename"
            ) AS "_8_e"
        )
      ) AS "root"
    FROM
      (
        SELECT
          *
        FROM
          "public"."get_loads_with_extra_data_v3"(
            ('-87.6298') :: numeric,
            ('41.8781') :: numeric,
            ('-95.3698') :: numeric,
            ('29.7604') :: numeric,
            ('100.0') :: numeric,
            ('100.0') :: numeric,
            ('3a236353-b055-e911-aa1e-b0e52ccc70f6') :: uuid,
            ('0054X00000CnbA0QAJ') :: text
          ) AS "_0_get_loads_with_extra_data_v3"
        WHERE
          (
            (
              (
                (
                  "_0_get_loads_with_extra_data_v3"."origin_earlytime"
                ) < (('2021-04-11') :: timestamp)
              )
              AND (
                (
                  "_0_get_loads_with_extra_data_v3"."origin_earlytime"
                ) >= (('2021-02-24') :: timestamp)
              )
            )
            AND (
              (
                (
                  "_0_get_loads_with_extra_data_v3"."destination_deadhead"
                ) <= (('100.0') :: float8)
              )
              AND (
                (
                  (
                    "_0_get_loads_with_extra_data_v3"."origin_deadhead"
                  ) <= (('100.0') :: float8)
                )
                AND (
                  (
                    "_0_get_loads_with_extra_data_v3"."legacy_load_id"
                  ) IS NOT NULL
                )
              )
            )
          )
      ) AS "_1_root.base"
      LEFT OUTER JOIN LATERAL (
        SELECT
          row_to_json(
            (
              SELECT
                "_3_e"
              FROM
                (
                  SELECT
                    "_2_root.or.brokerProfile.base"."account_id" AS "accountId",
                    "_2_root.or.brokerProfile.base"."days_to_pay" AS "daysToPay",
                    "_2_root.or.brokerProfile.base"."days_to_pay_integer" AS "daysToPayInteger",
                    "_2_root.or.brokerProfile.base"."bond_enabled" AS "bondEnabled",
                    "_2_root.or.brokerProfile.base"."first_name" AS "firstName",
                    "_2_root.or.brokerProfile.base"."last_name" AS "lastName",
                    "_2_root.or.brokerProfile.base"."account_name" AS "accountName",
                    "_2_root.or.brokerProfile.base"."experience_factor" AS "experienceFactor",
                    "_2_root.or.brokerProfile.base"."id" AS "id",
                    "_2_root.or.brokerProfile.base"."email_address" AS "emailAddress",
                    "_2_root.or.brokerProfile.base"."phone" AS "phone",
                    "_2_root.or.brokerProfile.base"."pay_enabled" AS "payEnabled",
                    "_2_root.or.brokerProfile.base"."dot" AS "dot",
                    "_2_root.or.brokerProfile.base"."bond_type_id" AS "bondTypeId",
                    "_2_root.or.brokerProfile.base"."truck_company_id" AS "truckCompanyId",
                    "_2_root.or.brokerProfile.base"."carrier_mc" AS "carrierMC",
                    "_2_root.or.brokerProfile.base"."carrier_mc_prefix" AS "carrierMCPrefix",
                    "_2_root.or.brokerProfile.base"."broker_mc" AS "brokerMC",
                    "_2_root.or.brokerProfile.base"."broker_mc_prefix" AS "brokerMCPrefix",
                    'broker_profile' AS "__typename"
                ) AS "_3_e"
            )
          ) AS "brokerProfile"
        FROM
          (
            SELECT
              *
            FROM
              "public"."broker_profile"
            WHERE
              (("_1_root.base"."broker_id") = ("id"))
          ) AS "_2_root.or.brokerProfile.base"
      ) AS "_4_root.or.brokerProfile" ON ('true')
      LEFT OUTER JOIN LATERAL (
        SELECT
          row_to_json(
            (
              SELECT
                "_6_e"
              FROM
                (
                  SELECT
                    "_5_root.or.postAsUser.base"."first_name" AS "firstName",
                    "_5_root.or.postAsUser.base"."last_name" AS "lastName",
                    "_5_root.or.postAsUser.base"."email_address" AS "emailAddress",
                    "_5_root.or.postAsUser.base"."phone" AS "phone",
                    'broker_profile' AS "__typename"
                ) AS "_6_e"
            )
          ) AS "postAsUser"
        FROM
          (
            SELECT
              *
            FROM
              "public"."broker_profile"
            WHERE
              (("_1_root.base"."post_as_user_id") = ("id"))
          ) AS "_5_root.or.postAsUser.base"
      ) AS "_7_root.or.postAsUser" ON ('true')
    ORDER BY
      "root.pg.is_book_it_now" DESC NULLS LAST,
      "root.pg.updated_on" DESC NULLS LAST
    LIMIT
      105 OFFSET ('0') :: integer
  ) AS "_9_root"