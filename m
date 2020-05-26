Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1041E2B8C
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 21:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC58A230FD;
	Tue, 26 May 2020 19:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BK7rlYNrZq6j; Tue, 26 May 2020 19:06:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A4A5F230BD;
	Tue, 26 May 2020 19:06:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CC47C016F;
	Tue, 26 May 2020 19:06:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 661FFC016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 19:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 582FA2288E
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 19:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7sHm01cFFrz for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 19:06:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 622CA22CC6
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 19:06:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DC3A20873;
 Tue, 26 May 2020 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590519981;
 bh=cmVh0OPeml6D5NC6kDs0bsSrpH4XAy+2xRC/rnWJl84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M2z7NTUUdWCxY+J/baluyE9whPqhbZYQxiY7Jaj6TVfp63toiQz2Ye4BwLcxLbLaB
 EW4LYaNe7UfB6ef+xila9f5IXCA6AL0WrC4Bq/JgqD9p1v+5O0ro3Eww7pk4vc56IX
 D2F+47qin2ONSTPv0FOXHb20yPUPBxvyGkl6HBDY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 012/111] iommu/amd: Fix over-read of ACPI UID from IVRS
 table
Date: Tue, 26 May 2020 20:52:30 +0200
Message-Id: <20200526183933.727706104@linuxfoundation.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526183932.245016380@linuxfoundation.org>
References: <20200526183932.245016380@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Monakov <amonakov@ispras.ru>, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Alexander Monakov <amonakov@ispras.ru>

[ Upstream commit e461b8c991b9202b007ea2059d953e264240b0c9 ]

IVRS parsing code always tries to read 255 bytes from memory when
retrieving ACPI device path, and makes an assumption that firmware
provides a zero-terminated string. Both of those are bugs: the entry
is likely to be shorter than 255 bytes, and zero-termination is not
guaranteed.

With Acer SF314-42 firmware these issues manifest visibly in dmesg:

AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0\xf0\xa5, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1\xf0\xa5, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2\xf0\xa5, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3>\x83e\x8d\x9a\xd1...

The first three lines show how the code over-reads adjacent table
entries into the UID, and in the last line it even reads garbage data
beyond the end of the IVRS table itself.

Since each entry has the length of the UID (uidl member of ivhd_entry
struct), use that for memcpy, and manually add a zero terminator.

Avoid zero-filling hid and uid arrays up front, and instead ensure
the uid array is always zero-terminated. No change needed for the hid
array, as it was already properly zero-terminated.

Fixes: 2a0cb4e2d423c ("iommu/amd: Add new map for storing IVHD dev entry type HID")

Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
Link: https://lore.kernel.org/r/20200511102352.1831-1-amonakov@ispras.ru
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu_init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index ef14b00fa94b..135ae5222cf3 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -1331,8 +1331,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 		}
 		case IVHD_DEV_ACPI_HID: {
 			u16 devid;
-			u8 hid[ACPIHID_HID_LEN] = {0};
-			u8 uid[ACPIHID_UID_LEN] = {0};
+			u8 hid[ACPIHID_HID_LEN];
+			u8 uid[ACPIHID_UID_LEN];
 			int ret;
 
 			if (h->type != 0x40) {
@@ -1349,6 +1349,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 				break;
 			}
 
+			uid[0] = '\0';
 			switch (e->uidf) {
 			case UID_NOT_PRESENT:
 
@@ -1363,8 +1364,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 				break;
 			case UID_IS_CHARACTER:
 
-				memcpy(uid, (u8 *)(&e->uid), ACPIHID_UID_LEN - 1);
-				uid[ACPIHID_UID_LEN - 1] = '\0';
+				memcpy(uid, &e->uid, e->uidl);
+				uid[e->uidl] = '\0';
 
 				break;
 			default:
-- 
2.25.1



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
