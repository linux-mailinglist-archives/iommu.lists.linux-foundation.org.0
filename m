Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925A246352
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 11:27:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B2617204A7;
	Mon, 17 Aug 2020 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvCiJFMcfp+N; Mon, 17 Aug 2020 09:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 92293204A2;
	Mon, 17 Aug 2020 09:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9A2C0051;
	Mon, 17 Aug 2020 09:27:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DED8AC0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CE62F87A8D
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSRytks7DTQn for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 569478712D
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:27:31 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E6CF2072D;
 Mon, 17 Aug 2020 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597656451;
 bh=J/kOpSEU8RbORM5aCdkVXUkRjQk8bFOWgJybhAWbpJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vqk5sYZZ5vFZvh+OqPDYux84g9ZoKEUfl5z4tXlktjbc5mbcZQo9e27w5hlB9T2ZO
 hUtwy0hXhHzgSFFRkZjOfcnrDWyr8IUSf4FplhzqtGDtOHOLFXvmhtO/K4kBNzavLa
 F3lePsGgArFX+LDzGfPRsQr7vKYAV3zzh8B8ZqAs=
Date: Mon, 17 Aug 2020 11:27:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 00/16] IOMMU driver for Kirin 960/970
Message-ID: <20200817112725.26f1b7d6@coco.lan>
In-Reply-To: <20200817082106.GA16296@infradead.org>
References: <cover.1597650455.git.mchehab+huawei@kernel.org>
 <20200817082106.GA16296@infradead.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, Chenfeng <puck.chen@hisilicon.com>,
 mauro.chehab@huawei.com, Suzhuangluan <suzhuangluan@hisilicon.com>,
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

Hi Christoph,

Em Mon, 17 Aug 2020 09:21:06 +0100
Christoph Hellwig <hch@infradead.org> escreveu:

> On Mon, Aug 17, 2020 at 09:49:59AM +0200, Mauro Carvalho Chehab wrote:
> > Add a driver for the Kirin 960/970 iommu.
> > 
> > As on the past series, this starts from the original 4.9 driver from
> > the 96boards tree:
> > 
> > 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> > 
> > The remaining patches add SPDX headers and make it build and run with
> > the upstream Kernel.  
> 
> Please don't add iommu drivers to staging, and just work with the
> maintainers to properly clean it up.

I need to start from the original patch in order to preserve its
authorship.

My plan is to work with the iommu subsystem maintainers after
have this (and another pending patch series for DRM) merged.

> I also don't think adding a totally out of date not compiling version
> is a good idea.  Please do a proper rollup, and if required (probably
> not in this case), split it into useful chunks.

This series make this driver working as expected.

I mean, while patch 01/16 is against Kernel 4.9, the other patches
on this series ports it to upstream, cleans up the driver and
address several issues on it.

This specific IOMMU seems to be an specific part of the SoC dedicated for 
the display engine and by the encoding/decoding images via the ISP. 
With this series, this driver builds and runs as expected, providing
IOMMU support needed by the upcoming KMS/DRM driver.

The only issue on it (as far as I can tell) is that the DT bindings
require some work, as, instead of using dma-ranges, the DRM driver binds
into it with:

	smmu_lpae {
                 compatible = "hisilicon,smmu-lpae";
         };

         dpe: dpe@e8600000 {
                 compatible = "hisilicon,kirin970-dpe";
...
                 iommu_info {
                         start-addr = <0x8000>;
                         size = <0xbfff8000>;
                 };
         };

In order to properly address it, the best would be to also have the
DRM driver merged upstream, as it relies on it. So, a change in DT will 
also mean a change at the way the DRM uses it.

The DRM itself should go via staging, as it has some bugs that I'd
like to fix before moving it to drivers/gpu/drm. Those are more
tricky to solve, as they seem to require using different settings for 
some hardware registers, and the downstream driver also have the same 
issues. Fixing them will likely require some time.

Thanks,
Mauro
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
