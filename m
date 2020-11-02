Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E32A312C
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 18:16:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDAE886C48;
	Mon,  2 Nov 2020 17:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CtZhDyNc0-a; Mon,  2 Nov 2020 17:16:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5529286C3B;
	Mon,  2 Nov 2020 17:16:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CB0C0051;
	Mon,  2 Nov 2020 17:16:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 327EEC0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 17:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2089686B9D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 17:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzRpTBoBKzMA for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 17:16:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A9FB086B6D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 17:16:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604337392; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: To: From: Date: Sender;
 bh=vj+zpfmdt/UrOyrf9DlMG0DgkyLSy+JL1jA0FBPdMew=;
 b=eR2JxIIYvT75G2P8AmLcSlWhh5JoyPx2vWc4Y7f6dvRvb5/AHF6tblVJprwYE7/kbGzuSNje
 gUaQagXO1INrujkvQppruC0HW92EiS77Ymvft4BegJR5GtzboReyl8dBV77L2BJTUL5uXYt6
 LCtwA6Ke5RVybHoj4iazUOgOXv8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fa03ef0d981633da3595eb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 17:16:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5FD48C43387; Mon,  2 Nov 2020 17:16:32 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C958BC433FE;
 Mon,  2 Nov 2020 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C958BC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 2 Nov 2020 10:16:26 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sibi Sankar <sibis@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/4] iommu/arm-smmu: Add adreno-smmu implementation
 and bindings
Message-ID: <20201102171626.GA5338@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201027223408.469893-1-jcrouse@codeaurora.org>
 <20201029172607.GA30745@willie-the-truck>
 <20201102170823.GA1032@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102170823.GA1032@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Mon, Nov 02, 2020 at 10:08:23AM -0700, Jordan Crouse wrote:
> On Thu, Oct 29, 2020 at 05:26:08PM +0000, Will Deacon wrote:
> > On Tue, Oct 27, 2020 at 04:34:04PM -0600, Jordan Crouse wrote:
> > > This short series adds support for the adreno-smmu implementation of the
> > > arm-smmu driver and the device-tree bindings to turn on the implementation
> > > for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> > > per-instance pagetables in the drm/msm driver.
> > > 
> > > No deltas in this patchset since the last go-around for 5.10 [1].
> > > 
> > > [1] https://patchwork.freedesktop.org/series/81393/
> > > 
> > > Jordan Crouse (3):
> > >   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
> > >   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
> > >   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> > > 
> > > Rob Clark (1):
> > >   iommu/arm-smmu: Add a way for implementations to influence SCTLR
> > 
> > FYI: this patch (patch 4/4) doesn't seem to have made it anywhere (I don't
> > have it, and neither does the archive).
> > 
> > Will
> 
> Patch 4/4 was the bindings for sdm845 and I didn't explicitly add IOMMU to the
> CC list and so patman did what patman does.
> 
> I'll resend.

Stack re-sent with you and Robin and the list on the CC for the bindings. I
expect that Bjorn can pick up the bindings patches once the adreno-smmu patch is
accepted but it is good for everybody to get the full picture.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
