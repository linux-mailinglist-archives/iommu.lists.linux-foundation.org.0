Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF2151FAE
	for <lists.iommu@lfdr.de>; Tue,  4 Feb 2020 18:42:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 113E084F58;
	Tue,  4 Feb 2020 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5pOvtffpzlJ; Tue,  4 Feb 2020 17:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B758850D6;
	Tue,  4 Feb 2020 17:42:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E1D2C0174;
	Tue,  4 Feb 2020 17:42:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A53DAC0174
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 17:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 92B6D20400
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 17:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgRAn0O2FSA9 for <iommu@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 17:42:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by silver.osuosl.org (Postfix) with ESMTPS id 47A8A203F0
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 17:42:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580838141; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3GsEF9tQsQwX5+o3nKkgPwf7PL4h+Nm6qziK+o3nvkQ=;
 b=e1IPwZj6i2+fR3CdwA6aLpeXC1sxrF0rai5JlSMW/jpHl3CjqH2ynYftVGBvaZqX4aHQuzRj
 Zh9ckzPnaqurX3qVwWqz9fOs5dn2rvGORP7uBZVi8vM5IkRkIG4XhXNeusMIo+d1Eo2YGnHb
 Il1nBFk1FGOMY3t1vZdrw2c7scs=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e39acfb.7fcc96b1f228-smtp-out-n01;
 Tue, 04 Feb 2020 17:42:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 20996C447A2; Tue,  4 Feb 2020 17:42:18 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B58DC433CB;
 Tue,  4 Feb 2020 17:42:17 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 04 Feb 2020 23:12:17 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob
 Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Allow client devices to select direct
 mapping
In-Reply-To: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <7761534cdb4f1891d993e73931894a63@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hello Robin, Will

On 2020-01-22 17:18, Sai Prakash Ranjan wrote:
> This series allows drm devices to set a default identity
> mapping using iommu_request_dm_for_dev(). First patch is
> a cleanup to support other SoCs to call into QCOM specific
> implementation and preparation for second patch.
> Second patch sets the default identity domain for drm devices.
> 
> Jordan Crouse (1):
>   iommu/arm-smmu: Allow client devices to select direct mapping
> 
> Sai Prakash Ranjan (1):
>   iommu: arm-smmu-impl: Convert to a generic reset implementation
> 
>  drivers/iommu/arm-smmu-impl.c |  8 +++--
>  drivers/iommu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++++++--
>  drivers/iommu/arm-smmu.c      |  3 ++
>  drivers/iommu/arm-smmu.h      |  5 ++++
>  4 files changed, 65 insertions(+), 6 deletions(-)

Any review comments?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
