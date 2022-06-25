Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D055AA36
	for <lists.iommu@lfdr.de>; Sat, 25 Jun 2022 14:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCAA40B03;
	Sat, 25 Jun 2022 12:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCAA40B03
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrTFY70s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTg0v8Gv4OJR; Sat, 25 Jun 2022 12:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C633040AFE;
	Sat, 25 Jun 2022 12:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C633040AFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EE45C002D;
	Sat, 25 Jun 2022 12:56:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E605BC002D
 for <iommu@lists.linux-foundation.org>; Sat, 25 Jun 2022 12:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF40260F30
 for <iommu@lists.linux-foundation.org>; Sat, 25 Jun 2022 12:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF40260F30
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=jrTFY70s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RP7VYSKKLlIf for <iommu@lists.linux-foundation.org>;
 Sat, 25 Jun 2022 12:56:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F6D60C20
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F6D60C20
 for <iommu@lists.linux-foundation.org>; Sat, 25 Jun 2022 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656161808; x=1687697808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t65pYKyMV4XOK7nEHhdalG87XLHrbrBHX7dnd091tts=;
 b=jrTFY70sEYytG3uwjclP/yzMmjXtQHwXl4IhSDAZXjYMonh9hAwcpJu6
 XI5HyzvAJjxgvFEDyZU/ChCH1vwhYtVH9eZC6lizJ84XE+pslZMk64ncv
 mxt0wqAJ2JCPpx9KELbieDPWZ1hXiLJvZPEvUZtG1/EjXaSRosYvj3hD2
 o3gX+lPYlMPrTyE2/vcYaxvGGWxzh7jcVQarGicnMRBrIZK+OGeTO8t7F
 xbJtRenlznHmFQEgmeoxlMzxceobcmviyn56Rfc7SmXc1XjLVQp7Uo4Nh
 k+z6gUjY60IugtYEOv/W6V7qRhxE9UeenyAQdyv+sVoGMKzljAoADhs1T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="278728009"
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; d="scan'208";a="278728009"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 05:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; d="scan'208";a="586890410"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by orsmga007.jf.intel.com with ESMTP; 25 Jun 2022 05:56:45 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Steve Wahl <steve.wahl@hpe.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v1 6/6] iommu/vt-d: Make DMAR_UNITS_SUPPORTED default 1024
Date: Sat, 25 Jun 2022 20:52:04 +0800
Message-Id: <20220625125204.2199437-7-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
References: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <russ.anderson@hpe.com>,
 Mike Travis <mike.travis@hpe.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>
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

If the available hardware exceeds DMAR_UNITS_SUPPORTED (previously set
to MAX_IO_APICS, or 128), it causes these messages: "DMAR: Failed to
allocate seq_id", "DMAR: Parse DMAR table failure.", and "x2apic: IRQ
remapping doesn't support X2APIC mode x2apic disabled"; and the system
fails to boot properly.

To support up to 64 sockets with 10 DMAR units each (640), make the
value of DMAR_UNITS_SUPPORTED default 1024.

Signed-off-by: Steve Wahl<steve.wahl@hpe.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/dmar.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index cbd714a198a0..d81a51978d01 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -18,11 +18,7 @@
 
 struct acpi_dmar_header;
 
-#ifdef	CONFIG_X86
-# define	DMAR_UNITS_SUPPORTED	MAX_IO_APICS
-#else
-# define	DMAR_UNITS_SUPPORTED	64
-#endif
+#define DMAR_UNITS_SUPPORTED	1024
 
 /* DMAR Flags */
 #define DMAR_INTR_REMAP		0x1
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
