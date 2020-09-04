Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F261125D456
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:11:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 968C186DA9;
	Fri,  4 Sep 2020 09:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIpwVINYZquL; Fri,  4 Sep 2020 09:11:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE0D286D99;
	Fri,  4 Sep 2020 09:11:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 981F3C0051;
	Fri,  4 Sep 2020 09:11:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D711C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 84C278744E
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFXeUoq-fooJ for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:11:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E1C51873FC
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:11:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4466F3D5; Fri,  4 Sep 2020 11:11:19 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:11:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Message-ID: <20200904091117.GH6714@8bytes.org>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Wambui Karuga <wambui.karugax@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Hanna Hawa <hannah@marvell.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, Sam Ravnborg <sam@ravnborg.org>,
 Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sibi Sankar <sibis@codeaurora.org>, Thierry Reding <treding@nvidia.com>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, Stephen Boyd <swboyd@chromium.org>,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Shawn Guo <shawn.guo@linaro.org>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 17, 2020 at 03:01:25PM -0700, Rob Clark wrote:
> Jordan Crouse (12):
>   iommu/arm-smmu: Pass io-pgtable config to implementation specific
>     function
>   iommu/arm-smmu: Add support for split pagetables
>   iommu/arm-smmu: Prepare for the adreno-smmu implementation
>   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   drm/msm: Add a context pointer to the submitqueue
>   drm/msm: Drop context arg to gpu->submit()
>   drm/msm: Set the global virtual address range from the IOMMU domain
>   drm/msm: Add support to create a local pagetable
>   drm/msm: Add support for private address space instances
>   drm/msm/a6xx: Add support for per-instance pagetables
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
> Rob Clark (8):
>   drm/msm: remove dangling submitqueue references
>   iommu: add private interface for adreno-smmu
>   drm/msm/gpu: add dev_to_gpu() helper
>   drm/msm: set adreno_smmu as gpu's drvdata
>   iommu/arm-smmu: constify some helpers
>   arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
>   iommu/arm-smmu: add a way for implementations to influence SCTLR
>   drm/msm: show process names in gem_describe

Can the DRM parts be merged independently from the IOMMU parts or does
this need to be queued together? If it needs to be together I defer the
decission to Will through which tree this should go.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
