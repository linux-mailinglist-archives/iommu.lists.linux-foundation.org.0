Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAFA1C8BA5
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 15:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B1C28855F;
	Thu,  7 May 2020 13:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iejwIcsNyEkK; Thu,  7 May 2020 13:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A33B48708C;
	Thu,  7 May 2020 13:02:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88F94C07FF;
	Thu,  7 May 2020 13:02:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D541C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 13:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 838C18708C
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 13:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zq1Vr-X98kyb for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 13:02:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E2B486E9E
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 13:02:17 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCD58208D6;
 Thu,  7 May 2020 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588856537;
 bh=FOLAqCJSZFjeRrOo2AB0h8nYBfFZfVGOKBM3v6LFHEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPdVXwPH7TI3PLb2Kzf96tHmWwUOaHaRsR9QY3oETGLePCe9qnlm3SrHoIHVJvrhl
 USV/bVxAywRxh3AAjmb8S7vCYFM5W9+E/KCoYipYYHVLXWsh1cDrwIfRPR5fgggIzI
 QUXnyvUgJqyr8F5xVYoQdqXVxsH20PpnU3tHRjQw=
Date: Thu, 7 May 2020 14:02:11 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 4/6] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
Message-ID: <20200507130210.GB31783@willie-the-truck>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <8ef5d93c74f5cd9e4a6edab86d1d46efbf3aa038.1587407458.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ef5d93c74f5cd9e4a6edab86d1d46efbf3aa038.1587407458.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Evan Green <evgreen@chromium.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sibi Sankar <sibis@codeaurora.org>,
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

On Tue, Apr 21, 2020 at 12:03:52AM +0530, Sai Prakash Ranjan wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> The Q6 modem sub-system has direct access to DDR through memnoc.
> Also SMMU is not expected to provide access control/translation
> for these SIDs (sandboxing of the modem is achieved through XPUs
> engaged using SMC calls). So request direct mapping for modem on
> platforms which don't have TrustZone.

The Z7 space rocket framework has limited access to water through BROADCHAN.
Also, this commit message really sucks. So please can you rewrite it in a
way that makes sense to people outside of your office?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
