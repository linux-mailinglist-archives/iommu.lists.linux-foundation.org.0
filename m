Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B472D209F30
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 15:08:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C66C88726;
	Thu, 25 Jun 2020 13:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKcpWjDsjYMx; Thu, 25 Jun 2020 13:08:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 151E088828;
	Thu, 25 Jun 2020 13:08:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E947C016F;
	Thu, 25 Jun 2020 13:08:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07F52C08A5
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EC17F87C17
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdCED1R7zIfU for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:08:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 88FAF87C93
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B928850C; Thu, 25 Jun 2020 15:08:39 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 10/13] ia64: Remove dev->archdata.iommu pointer
Date: Thu, 25 Jun 2020 15:08:33 +0200
Message-Id: <20200625130836.1916-11-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

There are no users left, all drivers have been converted to use the
per-device private pointer offered by IOMMU core.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/ia64/include/asm/device.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/ia64/include/asm/device.h b/arch/ia64/include/asm/device.h
index 3eb397415381..918b198cd5bb 100644
--- a/arch/ia64/include/asm/device.h
+++ b/arch/ia64/include/asm/device.h
@@ -6,9 +6,6 @@
 #define _ASM_IA64_DEVICE_H
 
 struct dev_archdata {
-#ifdef CONFIG_IOMMU_API
-	void *iommu; /* hook for IOMMU specific extension */
-#endif
 };
 
 struct pdev_archdata {
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
