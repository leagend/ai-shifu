"""add feedback table

Revision ID: 01891133d0a2
Revises: 7b0bf13de9be
Create Date: 2024-08-30 08:42:35.187750

"""

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = "01891133d0a2"
down_revision = "7b0bf13de9be"
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table(
        "user_feedback",
        sa.Column(
            "id",
            mysql.BIGINT(),
            autoincrement=True,
            nullable=False,
            comment="Unique ID",
        ),
        sa.Column("user_id", sa.String(length=36), nullable=False, comment="User UUID"),
        sa.Column(
            "feedback", sa.String(length=300), nullable=False, comment="Feedback"
        ),
        sa.Column("created", sa.TIMESTAMP(), nullable=False, comment="Creation time"),
        sa.Column("updated", sa.TIMESTAMP(), nullable=False, comment="Update time"),
        sa.PrimaryKeyConstraint("id"),
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table("user_feedback")
    # ### end Alembic commands ###
