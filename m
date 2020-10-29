Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73B29F31A
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 18:26:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 164BB86A37;
	Thu, 29 Oct 2020 17:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99m8H0q2CVDS; Thu, 29 Oct 2020 17:26:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49DB786C75;
	Thu, 29 Oct 2020 17:26:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34726C0051;
	Thu, 29 Oct 2020 17:26:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 767F1C0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72B3A86A37
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJJZ2yvBGofM for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 17:26:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 05CBD86C18
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:16 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CAFF206CB;
 Thu, 29 Oct 2020 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603992375;
 bh=ydtT245KR4NOVY4gur+adaCMxoV41NBuWwlp88cEl8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CYT+Aaf4mrNMx1sFQUTd5llJYqfeqgcZLxEcsAuy3xMBgfjPjBCVTpQUYv58eaCk5
 4NisOpJzE1bJoj3JWcE8rnPiKgsOV9MMkuUIs9m/G221zTHsJb2Uct40FZVjv/puBI
 QetIP8XCZNX0p/kL0f0uDAC7nRFocK+i4DkNiL7Y=
Date: Thu, 29 Oct 2020 17:26:08 +0000
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v18 0/4] iommu/arm-smmu: Add adreno-smmu implementation
 and bindings
Message-ID: <20201029172607.GA30745@willie-the-truck>
References: <20201027223408.469893-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027223408.469893-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
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

On Tue, Oct 27, 2020 at 04:34:04PM -0600, Jordan Crouse wrote:
> This short series adds support for the adreno-smmu implementation of the
> arm-smmu driver and the device-tree bindings to turn on the implementation
> for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> per-instance pagetables in the drm/msm driver.
> 
> No deltas in this patchset since the last go-around for 5.10 [1].
> 
> [1] https://patchwork.freedesktop.org/series/81393/
> 
> Jordan Crouse (3):
>   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
> Rob Clark (1):
>   iommu/arm-smmu: Add a way for implementations to influence SCTLR

FYI: this patch (patch 4/4) doesn't seem to have made it anywhere (I don't
have it, and neither does the archive).

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
