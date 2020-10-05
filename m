Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFE2839CA
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 17:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BFF3D866A8;
	Mon,  5 Oct 2020 15:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSFNgj6pzNui; Mon,  5 Oct 2020 15:29:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31DA7866BD;
	Mon,  5 Oct 2020 15:29:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CC72C0051;
	Mon,  5 Oct 2020 15:29:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A003C1AD4
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29833204C6
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQkFHxEX6Zf5 for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 15:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id E43E92042E
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HqqwdRjVDoj9+F/+r3bh/9jhBNHxbUs9BYhMrQMENKE=; b=gmD3ayvSPj1DprApblctSTU3J4
 r0DicvjW6naTXV3IHO74tZFlH3LaakjjaVCL2AmVdGM6Vf4lN6PgfnZClO3Oma29yDjFn2q82HeAh
 bI2ZUVOrCy+1LxonlKeX694LuAi2DWjRyI/590pFmxWz1rcpbUep7QbmmllcNwnwaiyGsfZMI+ko8
 9UMhc4eiP4zSJ52JRaoFO54FhpBZsxPO+P7Wl8T7opu0SCJPRzZVua/OcoEcE6Y2f4QZ0KajckUmB
 rPoh1YXm+IweE+Yaz+4G6wppvU6+BiU2V90NyC7KkVELfdQNW6r+bxRL+L8Odx03+Xb2GvfRMIhZx
 gZjw1cKw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSQ4-0001mP-V1; Mon, 05 Oct 2020 15:28:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kPSQ4-0045Qz-FI; Mon, 05 Oct 2020 16:28:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH 11/13] x86/smp: Allow more than 255 CPUs even without
 interrupt remapping
Date: Mon,  5 Oct 2020 16:28:54 +0100
Message-Id: <20201005152856.974112-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005152856.974112-1-dwmw2@infradead.org>
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
 <20201005152856.974112-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 iommu <iommu@lists.linux-foundation.org>, linux-hyperv@vger.kernel.org,
 kvm <kvm@vger.kernel.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

Now that external interrupt affinity can be limited to the range of
CPUs that can be reached through legacy IOAPIC RTEs and MSI, it is
possible to use additional CPUs.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kernel/apic/apic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 069f5e9f1d28..750a92464bec 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1881,8 +1881,6 @@ static __init void try_to_enable_x2apic(int remap_mode)
 		 */
 		x2apic_phys = 1;
 	}
-	if (apic_limit)
-		x2apic_set_max_apicid(apic_limit);
 
 	/* Build the affinity mask for interrupts that can't be remapped. */
 	cpumask_clear(&x86_non_ir_cpumask);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
