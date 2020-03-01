{% macro incremental_filter() %}

    {% if is_incremental() %}

        {% if adapter.get_relation(this.database, this.schema, this.table) and not flags.FULL_REFRESH %}
            AND date_time >= '{{ var("start_date") }}' AND date_time < '{{ var("end_date") }}'
        {% endif %}

    {% endif %}

{% endmacro %}