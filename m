Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097528EEA7
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 10:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02000885DC;
	Thu, 15 Oct 2020 08:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY7UiEHvXgDG; Thu, 15 Oct 2020 08:40:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C02A88613;
	Thu, 15 Oct 2020 08:40:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B146C0051;
	Thu, 15 Oct 2020 08:40:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5724C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0F2F880CA
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 170tp8CSbMcl for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 08:40:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 65854880C7
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:40:15 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C8A22224A;
 Thu, 15 Oct 2020 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602751214;
 bh=iEOV0qFCwAa4x2I6L0Fl5blrVz6Ofac36yk+aR5M4b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p36N9EioeWHKRZCdCRXZArhO6aOx6gew9HVR/iPljFlmjsblV774sa8gxH5li5rkN
 Jnv0Gfk4vaQfWLMlJkgz4hGBVwVZ3GYUn1HkoBhaTMBdSiFl7EVaP34okdEbS0cu96
 waYgH1X+2jD1CY8Jsnd+uCwWlpp66CcW0oDM215Q=
Date: Thu, 15 Oct 2020 09:40:09 +0100
From: Will Deacon <will@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v3 1/8] arm64: mm: Move reserve_crashkernel() into
 mem_init()
Message-ID: <20201015084008.GB4537@willie-the-truck>
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
 <20201014191211.27029-2-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014191211.27029-2-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com, ardb@kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Oct 14, 2020 at 09:12:03PM +0200, Nicolas Saenz Julienne wrote:
> crashkernel might reserve memory located in ZONE_DMA. We plan to delay
> ZONE_DMA's initialization after unflattening the devicetree and ACPI's
> boot table initialization, so move it later in the boot process.
> Specifically into mem_init(), this is the last place crashkernel will be
> able to reserve the memory before the page allocator kicks in and there is
> no need to do it earlier.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  arch/arm64/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please can you cc me on the whole series next time? I know different
maintainers have different preferences here, but I find it much easier to
figure out what's happening when I can see all of the changes together.

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
