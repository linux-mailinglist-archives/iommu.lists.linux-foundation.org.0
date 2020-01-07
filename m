Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE57132FA1
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 20:39:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EB0F857D8;
	Tue,  7 Jan 2020 19:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz6HcskC2rVg; Tue,  7 Jan 2020 19:39:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C26A885421;
	Tue,  7 Jan 2020 19:39:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2533C0881;
	Tue,  7 Jan 2020 19:39:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5135CC0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 19:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3F5F387850
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 19:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AttjgwUmi5Ss for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 19:39:39 +0000 (UTC)
X-Greylist: delayed 00:17:37 by SQLgrey-1.7.6
Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com
 [209.85.219.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7954D874E4
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 19:39:39 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id d7so569184qvq.12
 for <iommu@lists.linux-foundation.org>; Tue, 07 Jan 2020 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0CZJko/qdfQtke3cSJ7hp5iCIDiC0gTMp9RSBpUuJOk=;
 b=rTG3oakSdnKidDuXwG4ZZs5fx3OQ+4GtXtAX3iWIs4Z9OLjOUGTuyOkhixGJ5wjqin
 jB9KfpGs26CsfP3NsA1aA/3ekAszm7fbstk9CB6gzSN5cbPzbhxca94l/V6O1Jmd2ouJ
 JGXH5EXr6vE+59a7yJehUo84xKsWJfzBSbaqiT6Jl6wDlufqvPj89kBecDvM1wZ2rQCG
 a2qzC6LTkRePvRi/b3RKNPRDPMkK+EyoIIYHT4yDs7ov6F43GSg13PkleH260MxdgPWj
 nZZ/yyWu/5Hg1fg3o/COD+Y7CNb3jUIzpLumKyILA9SjoEF5cymE6PAGeiOYf+0w4Amo
 9RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0CZJko/qdfQtke3cSJ7hp5iCIDiC0gTMp9RSBpUuJOk=;
 b=Daipof2VkjaUTnKxBXAXpo8YeBzCQBG2KzLPPzwUo3TUuGdVQzc+YpOzauka077G9l
 CxCGcbUDUB0XP1B9o5eUIvZw00QYzZWUmwbh/vDsjftQJMxS43WA7TG2ql0MCbRheiBN
 YOvUXAxhbsHARDYl4cvZM0fYj96TIfXbXVIDKAVk5fP9i7Xo7IrCewPQJ57JkbD4xU6G
 1GuLi2YOJtilfJQBupigG0aljGdFd9XVxlat8TOZyZFyKOQwntJbXryzi8DOsXPRMaNf
 eq+UmmuBUzEi7XYsduAtzs/lScafXU8zP//bqnV4fwgrA+dr/si/UV4L2rB+FeXysUhO
 zJdA==
X-Gm-Message-State: APjAAAUdMMGP9Uz9HggIXSKiDriEegwC18M9SPU48cNHBtJwzodK+Wup
 YQb+VISuatmiYicCjXgdMhpjuwy3
X-Google-Smtp-Source: APXvYqy1XuWeSkKDVL3EoMMtcHhFWGHomaPsgpaJfot96+/U98N9OEGR9ZJgyWYhVGpflnd/U05ZRLSm
X-Received: by 2002:a37:801:: with SMTP id 1mr885696qki.326.1578424585781;
 Tue, 07 Jan 2020 11:16:25 -0800 (PST)
Date: Tue,  7 Jan 2020 14:16:09 -0500
In-Reply-To: <20200107191610.178185-1-brho@google.com>
Message-Id: <20200107191610.178185-2-brho@google.com>
Mime-Version: 1.0
References: <20200107191610.178185-1-brho@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH v2 1/2] iommu/vt-d: skip RMRR entries that fail the sanity
 check
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, 
 Yian Chen <yian.chen@intel.com>, Sohil Mehta <sohil.mehta@intel.com>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
From: Barret Rhoden via iommu <iommu@lists.linux-foundation.org>
Reply-To: Barret Rhoden <brho@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

RMRR entries describe memory regions that are DMA targets for devices
outside the kernel's control.

RMRR entries that fail the sanity check are pointing to regions of
memory that the firmware did not tell the kernel are reserved or
otherwise should not be used.

Instead of aborting DMAR processing, this commit skips these RMRR
entries and marks the firmware as tainted.  They will not be mapped into
the IOMMU, but the IOMMU can still be utilized.  If anything, when the
IOMMU is on, those devices will not be able to clobber RAM that the
kernel has allocated from those regions.

Signed-off-by: Barret Rhoden <brho@google.com>
---
 drivers/iommu/intel-iommu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0c8d81f56a30..a8bb458845bc 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4319,12 +4319,18 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
 	struct dmar_rmrr_unit *rmrru;
-	int ret;
 
 	rmrr = (struct acpi_dmar_reserved_memory *)header;
-	ret = arch_rmrr_sanity_check(rmrr);
-	if (ret)
-		return ret;
+	if (arch_rmrr_sanity_check(rmrr)) {
+		WARN_TAINT(1, TAINT_FIRMWARE_WORKAROUND,
+			   "Your BIOS is broken; bad RMRR [%#018Lx-%#018Lx]\n"
+			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
+			   rmrr->base_address, rmrr->end_address,
+			   dmi_get_system_info(DMI_BIOS_VENDOR),
+			   dmi_get_system_info(DMI_BIOS_VERSION),
+			   dmi_get_system_info(DMI_PRODUCT_VERSION));
+		return 0;
+	}
 
 	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
 	if (!rmrru)
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
