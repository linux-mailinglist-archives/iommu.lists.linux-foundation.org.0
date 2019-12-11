Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D43C11BE51
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 21:48:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0987D86D28;
	Wed, 11 Dec 2019 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xW52x5yp3Nv9; Wed, 11 Dec 2019 20:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A2F9486D1D;
	Wed, 11 Dec 2019 20:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87277C0881;
	Wed, 11 Dec 2019 20:48:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4C6DC0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A389586D19
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lzHCGeRDMQ0 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:48:54 +0000 (UTC)
X-Greylist: delayed 01:02:03 by SQLgrey-1.7.6
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E6C28354A
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 20:48:54 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id c202so8407238qkg.4
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=eThurwhGsm2B6q3iIMHM88H1qXnCFgfSyZ1R5IN3D8Q=;
 b=Umx9+Upz6YY6XIihuoQd5zSRR25JpUE9443iw0slpTRt9rNrW/QtJnrqTveFBBtjJu
 2JH4MKsLoac9Cd2LcAoXkBqLPsZlRurSsea3TqpFF1YcgKgM46PKOFk15t4RttfJzw7Z
 3WRf8UtSA8Cah1PzwrHkcXbW3XZuz32fyOKGdfbg7u+y00MScxn6dR9QwQTCKTbfPfDw
 7PZBlKQxhxQxVe5kgqyq6eGry8rcdQPjRGEdXzIUzwxr54P9t/0U4NXLP6nViYUJoh61
 Xt9Gj3hlTbCPYMCcmN21UifbHrNWP0kWauzhxKpIAla7DlfZwJxBIAisTHiAbjaf0SSB
 ubyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eThurwhGsm2B6q3iIMHM88H1qXnCFgfSyZ1R5IN3D8Q=;
 b=XrOkq8NtBiObShYjbC6B+9MHHm1jmO+dQConVq+BiqAc3ZQdqhdNqKYWXCP253xuzT
 +8nt3KZtLzhsyhdAx2rZPUTyKiceDCp3P6yLEkttFcI4qYEAGeKe2QXsvuSH2V/5+kDa
 kESfMPFJyJFDK63fP4xbyiRi6vhfIjdsx5AQC8N2eq6Jf96CQKpmqLbVEj643NZ4ZZkG
 0L4QC8Cv0yIk3EARHI5HBWZAAfP3oGNTo8+DSzHav0v7LvnzVZ2XyRr0uSE40zTo71xe
 Q6Hj4UOupJiUS766JaqNc2d8FW/7yXygbcO7DFdCbIsY/89xImAAj6URz6jeNRubxtJ9
 oPnw==
X-Gm-Message-State: APjAAAVbFfLJ8C4OEi2itaWhOPNWirzdrAW26G9VRHyGts87AKfcT5J/
 G45xSEmDXBnaxNzjwXXoSEWX1t/i
X-Google-Smtp-Source: APXvYqz9saMrD1OROuGMjFvRuK1d962ToYdHGinwknsX48BtwzWvboUzDxn9EnEBlb28+/SXokSHbbsr
X-Received: by 2002:ac5:c99c:: with SMTP id e28mr5314125vkm.52.1576093609782; 
 Wed, 11 Dec 2019 11:46:49 -0800 (PST)
Date: Wed, 11 Dec 2019 14:46:06 -0500
In-Reply-To: <20191211194606.87940-1-brho@google.com>
Message-Id: <20191211194606.87940-4-brho@google.com>
Mime-Version: 1.0
References: <20191211194606.87940-1-brho@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH 3/3] iommu/vt-d: skip invalid RMRR entries
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

The VT-d docs specify requirements for the RMRR entries base and end
(called 'Limit' in the docs) addresses.

This commit will cause the DMAR processing to skip any RMRR entries
that do not meet these requirements with the expectation that firmware
is giving us junk.

Signed-off-by: Barret Rhoden <brho@google.com>
---
 drivers/iommu/intel-iommu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index f7e09244c9e4..11322fefb883 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4307,6 +4307,18 @@ static void __init init_iommu_pm_ops(void)
 static inline void init_iommu_pm_ops(void) {}
 #endif	/* CONFIG_PM */
 
+static int rmrr_validity_check(struct acpi_dmar_reserved_memory *rmrr)
+{
+	if ((rmrr->base_address & PAGE_MASK) ||
+	    (rmrr->end_address <= rmrr->base_address) ||
+	    ((rmrr->end_address - rmrr->base_address + 1) & PAGE_MASK)) {
+		pr_err(FW_BUG "Broken RMRR base: %#018Lx end: %#018Lx\n",
+		       rmrr->base_address, rmrr->end_address);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
@@ -4314,7 +4326,7 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 	int ret;
 
 	rmrr = (struct acpi_dmar_reserved_memory *)header;
-	ret = arch_rmrr_sanity_check(rmrr);
+	ret = rmrr_validity_check(rmrr) || arch_rmrr_sanity_check(rmrr);
 	if (ret)
 		return 0;
 
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
