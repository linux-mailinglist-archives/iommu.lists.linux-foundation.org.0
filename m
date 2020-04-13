Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 036461A688A
	for <lists.iommu@lfdr.de>; Mon, 13 Apr 2020 17:12:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A567884FC0;
	Mon, 13 Apr 2020 15:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lE1q4CSJaZRT; Mon, 13 Apr 2020 15:12:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 146DB84AE3;
	Mon, 13 Apr 2020 15:12:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0642CC0172;
	Mon, 13 Apr 2020 15:12:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6FC7C0172
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8E11484AE3
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 15:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkyMVrDSczAQ for <iommu@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 15:12:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BCBD284763
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 15:12:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586790768; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=LU4lIIs6P7WbetJLktGFAgPFpHgnYydgpo5RLRCAr2Q=;
 b=firTYFXZUrdTmDZhKqy7gUN8UkyLtz/kGNDGBz4kPpIC5lQQz1dwxtFzibOQ9vLUk5wceCei
 RAfCq8QaahVYPf4CPXIwc6dCvrBLk/v2un2fw4Ie0q2EQVBo7Ccnh3XbnB5bYqKXz61ztEu+
 MPhHUT4CS9Gv+4XtUUqOD71WjBI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e94816f.7fbac1e66ce0-smtp-out-n05;
 Mon, 13 Apr 2020 15:12:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0A87DC44788; Mon, 13 Apr 2020 15:12:45 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E460C433F2;
 Mon, 13 Apr 2020 15:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E460C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Apr 2020 09:12:42 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Allow client devices to select
 direct mapping
Message-ID: <20200413151241.GB20818@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Matthias Kaehlcke <mka@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Tomasz Figa <tfiga@chromium.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <7761534cdb4f1891d993e73931894a63@codeaurora.org>
 <20200409233124.GW199755@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409233124.GW199755@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
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

On Thu, Apr 09, 2020 at 04:31:24PM -0700, Matthias Kaehlcke wrote:
> On Tue, Feb 04, 2020 at 11:12:17PM +0530, Sai Prakash Ranjan wrote:
> > Hello Robin, Will
> > 
> > On 2020-01-22 17:18, Sai Prakash Ranjan wrote:
> > > This series allows drm devices to set a default identity
> > > mapping using iommu_request_dm_for_dev(). First patch is
> > > a cleanup to support other SoCs to call into QCOM specific
> > > implementation and preparation for second patch.
> > > Second patch sets the default identity domain for drm devices.
> > > 
> > > Jordan Crouse (1):
> > >   iommu/arm-smmu: Allow client devices to select direct mapping
> > > 
> > > Sai Prakash Ranjan (1):
> > >   iommu: arm-smmu-impl: Convert to a generic reset implementation
> > > 
> > >  drivers/iommu/arm-smmu-impl.c |  8 +++--
> > >  drivers/iommu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++++++--
> > >  drivers/iommu/arm-smmu.c      |  3 ++
> > >  drivers/iommu/arm-smmu.h      |  5 ++++
> > >  4 files changed, 65 insertions(+), 6 deletions(-)
> > 
> > Any review comments?
> 
> Ping
> 
> What is the status of this series, is it ready to land or are any changes
> needed?
> 
> Thanks
> 
> Matthias

I think this is up in the air following the changes that Joerg suggested:
https://lists.linuxfoundation.org/pipermail/iommu/2020-April/043017.html

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
