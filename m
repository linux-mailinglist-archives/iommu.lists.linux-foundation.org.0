Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5591C8E3B
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 16:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6706526319;
	Thu,  7 May 2020 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiedHs2NvuOC; Thu,  7 May 2020 14:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27E982051A;
	Thu,  7 May 2020 14:18:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17B03C07FF;
	Thu,  7 May 2020 14:18:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FAC8C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C6E12051A
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKwJBg7gijQO for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DDB442052F
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:18:09 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E48542075E;
 Thu,  7 May 2020 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588861089;
 bh=Fe6gfF5urXSBFvBbOzUNW7fFTBNb7/Y+1nMsf2Yqk7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=moh/xIgqrEwzUio6N/CaL7SwsOTz2ms2PnrAifuDB9S9strf9Z7Z7ycBZFC2tFV/5
 ip5ugnTg010qNxa1egT9mC2QixcvUaFY+EYyRV4kxp2TchazDZ9JlY+on4Qf4Ff1NN
 r0BTI3tNk3+D3txlnN64FC23CYrJP/VQnaKjBcEg=
Date: Thu, 7 May 2020 15:18:03 +0100
From: Will Deacon <will@kernel.org>
To: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCHv4 4/6] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
Message-ID: <20200507141803.GA1422@willie-the-truck>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <8ef5d93c74f5cd9e4a6edab86d1d46efbf3aa038.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <20200507130210.GB31783@willie-the-truck>
 <f41beaa18f0ba49c3c6f7552291a0641@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f41beaa18f0ba49c3c6f7552291a0641@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel-owner@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, Evan Green <evgreen@chromium.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Thu, May 07, 2020 at 07:44:01PM +0530, Sibi Sankar wrote:
> On 2020-05-07 18:32, Will Deacon wrote:
> > On Tue, Apr 21, 2020 at 12:03:52AM +0530, Sai Prakash Ranjan wrote:
> > > From: Sibi Sankar <sibis@codeaurora.org>
> > > 
> > > The Q6 modem sub-system has direct access to DDR through memnoc.
> > > Also SMMU is not expected to provide access control/translation
> > > for these SIDs (sandboxing of the modem is achieved through XPUs
> > > engaged using SMC calls). So request direct mapping for modem on
> > > platforms which don't have TrustZone.
> > 
> > The Z7 space rocket framework has limited access to water through
> > BROADCHAN.
> > Also, this commit message really sucks. So please can you rewrite it in
> > a
> > way that makes sense to people outside of your office?
> 
> lol, sure I'll re-word ^^ tday

Thanks :)

WIll
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
