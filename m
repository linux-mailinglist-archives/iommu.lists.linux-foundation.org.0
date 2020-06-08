Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1EA1F232F
	for <lists.iommu@lfdr.de>; Tue,  9 Jun 2020 01:14:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 74ADC204FB;
	Mon,  8 Jun 2020 23:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xjx5i2gyO8GE; Mon,  8 Jun 2020 23:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B07122270;
	Mon,  8 Jun 2020 23:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 202EDC0894;
	Mon,  8 Jun 2020 23:14:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609F4C016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 23:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A50086055
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 23:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX1Dz9HyuC61 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 23:14:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 731E585F29
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 23:14:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7027621534;
 Mon,  8 Jun 2020 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658044;
 bh=ECHHm1tjjPiVV5BIUfnlAx1LvvWnDMygf0UXIqwcJhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kxiJfB+aOzmDkY22060RMIx+9bC5XSiqscH6AYhC8gbIWVsetw0Rao8qv1pXQKxW3
 DmF6rzk+ov0KbIZUfvDgOEk/nG4/UwrozNxdo2wx0JIjrnAz6igRvhQ52UILenXsZb
 Ue7ywNp4OtFqiIut8Lfi6Ut8KFiTUfSHv+3TfHs0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 093/606] iommu/amd: Fix over-read of ACPI UID from
 IVRS table
Date: Mon,  8 Jun 2020 19:03:38 -0400
Message-Id: <20200608231211.3363633-93-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Alexander Monakov <amonakov@ispras.ru>,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>
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
index 2b9a67ecc6ac..5b81fd16f5fa 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -1329,8 +1329,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 		}
 		case IVHD_DEV_ACPI_HID: {
 			u16 devid;
-			u8 hid[ACPIHID_HID_LEN] = {0};
-			u8 uid[ACPIHID_UID_LEN] = {0};
+			u8 hid[ACPIHID_HID_LEN];
+			u8 uid[ACPIHID_UID_LEN];
 			int ret;
 
 			if (h->type != 0x40) {
@@ -1347,6 +1347,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 				break;
 			}
 
+			uid[0] = '\0';
 			switch (e->uidf) {
 			case UID_NOT_PRESENT:
 
@@ -1361,8 +1362,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
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
