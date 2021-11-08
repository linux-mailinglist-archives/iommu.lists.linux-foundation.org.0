Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C8A447E13
	for <lists.iommu@lfdr.de>; Mon,  8 Nov 2021 11:37:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFB540243;
	Mon,  8 Nov 2021 10:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75IDy8MucGbr; Mon,  8 Nov 2021 10:37:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 919F94023D;
	Mon,  8 Nov 2021 10:37:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D522C0021;
	Mon,  8 Nov 2021 10:37:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE96C000E
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 10:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BE6A80E21
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 10:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kapsi.fi
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB7oLWM--YqQ for <iommu@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 10:37:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BB1F80DC3
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i/cmFLJWXjRGackmQbyW+VCsyR/4I0WIJ6EqrdSA6JY=; b=TgVDqLVO+s5RobZKj0e0tc5fNy
 sQ7s4SFC8WtG6elM+NAEv4mjxfpoy7JVFvonGPrL7zQr/ez3Zy+k/cZUaqJiRecRCcNi2P7VbkE8F
 ka3tcQvpeAovYzNEd+HkVHsCfpaMi0A8MmEWp93+1bfLdOoI1b6w4GoA214JujO2mNRUBzstQdeGa
 bLpBKQN1PyJKDS+X8rDt5TmKrMO9LNSjG+242s85JwTjTX7Vrv0uE+3eFdT/Lgf1H4RdXtzWOLNPt
 n83LDUWPlVc+rTMI2qPSbTvt1fc9jEFAk7Sd+yh6crFCPnwJUgWt/1tb+cKxoGcaWvVttLk2IRflv
 xP/M3HYw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mk21D-0008PS-Od; Mon, 08 Nov 2021 12:36:51 +0200
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
Date: Mon, 8 Nov 2021 12:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210916143302.2024933-1-mperttunen@nvidia.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 9/16/21 5:32 PM, Mikko Perttunen wrote:
> Hi all,
> 
> ***
> New in v2:
> 
> Added support for Tegra194
> Use standard iommu-map property instead of custom mechanism
> ***
> 
> this series adds support for Host1x 'context isolation'. Since
> when programming engines through Host1x, userspace can program in
> any addresses it wants, we need some way to isolate the engines'
> memory spaces. Traditionally this has either been done imperfectly
> with a single shared IOMMU domain, or by copying and verifying the
> programming command stream at submit time (Host1x firewall).
> 
> Since Tegra186 there is a privileged (only usable by kernel)
> Host1x opcode that allows setting the stream ID sent by the engine
> to the SMMU. So, by allocating a number of context banks and stream
> IDs for this purpose, and using this opcode at the beginning of
> each job, we can implement isolation. Due to the limited number of
> context banks only each process gets its own context, and not
> each channel.
> 
> This feature also allows sharing engines among multiple VMs when
> used with Host1x's hardware virtualization support - up to 8 VMs
> can be configured with a subset of allowed stream IDs, enforced
> at hardware level.
> 
> To implement this, this series adds a new host1x context bus, which
> will contain the 'struct device's corresponding to each context
> bank / stream ID, changes to device tree and SMMU code to allow
> registering the devices and using the bus, as well as the Host1x
> stream ID programming code and support in TegraDRM.
> 
> Device tree bindings are not updated yet pending consensus that the
> proposed changes make sense.
> 
> Thanks,
> Mikko
> 
> Mikko Perttunen (8):
>    gpu: host1x: Add context bus
>    gpu: host1x: Add context device management code
>    gpu: host1x: Program context stream ID on submission
>    iommu/arm-smmu: Attach to host1x context device bus
>    arm64: tegra: Add Host1x context stream IDs on Tegra186+
>    drm/tegra: falcon: Set DMACTX field on DMA transactions
>    drm/tegra: vic: Implement get_streamid_offset
>    drm/tegra: Support context isolation
> 
>   arch/arm64/boot/dts/nvidia/tegra186.dtsi  |  12 ++
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi  |  12 ++
>   drivers/gpu/Makefile                      |   3 +-
>   drivers/gpu/drm/tegra/drm.h               |   2 +
>   drivers/gpu/drm/tegra/falcon.c            |   8 +
>   drivers/gpu/drm/tegra/falcon.h            |   1 +
>   drivers/gpu/drm/tegra/submit.c            |  13 ++
>   drivers/gpu/drm/tegra/uapi.c              |  34 ++++-
>   drivers/gpu/drm/tegra/vic.c               |  38 +++++
>   drivers/gpu/host1x/Kconfig                |   5 +
>   drivers/gpu/host1x/Makefile               |   2 +
>   drivers/gpu/host1x/context.c              | 174 ++++++++++++++++++++++
>   drivers/gpu/host1x/context.h              |  27 ++++
>   drivers/gpu/host1x/context_bus.c          |  31 ++++
>   drivers/gpu/host1x/dev.c                  |  12 +-
>   drivers/gpu/host1x/dev.h                  |   2 +
>   drivers/gpu/host1x/hw/channel_hw.c        |  52 ++++++-
>   drivers/gpu/host1x/hw/host1x06_hardware.h |  10 ++
>   drivers/gpu/host1x/hw/host1x07_hardware.h |  10 ++
>   drivers/iommu/arm/arm-smmu/arm-smmu.c     |  13 ++
>   include/linux/host1x.h                    |  21 +++
>   include/linux/host1x_context_bus.h        |  15 ++
>   22 files changed, 488 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/gpu/host1x/context.c
>   create mode 100644 drivers/gpu/host1x/context.h
>   create mode 100644 drivers/gpu/host1x/context_bus.c
>   create mode 100644 include/linux/host1x_context_bus.h
> 

IOMMU/DT folks, any thoughts about this approach? The patches that are 
of interest outside of Host1x/TegraDRM specifics are patches 1, 2, 4, and 5.

Thanks,
Mikko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
