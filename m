Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB4EE4A5
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 17:28:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A12D7FC5;
	Mon,  4 Nov 2019 16:28:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F1194B0B
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 05:19:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9DF3C5D0
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 05:19:26 +0000 (UTC)
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2CA5A2190F;
	Mon,  4 Nov 2019 05:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572844766;
	bh=z1gws+aSLcizSySHy0g8q4QVV6+o3IMdyc+89gN/L88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6SyQw9Uht7TbkA7F1G7gSbqCTWXDYac9KsDBVA4Er8NPby/KZgL97xzqsikp5oud
	7o9zZDSPtDREhW9FzD8ukhbPsE+hPH7yVg7qTvw3TFi6kgNgktKQr2NQYSqyrQFYxS
	vuhEC1lsEnDlswIp/sqD0BtJYx9e2GHp3IwhmKwA=
Date: Sun, 3 Nov 2019 23:19:25 -0600
From: Andy Gross <agross@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
Message-ID: <20191104051925.GC5299@hector.lan>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Will Deacon <will@kernel.org>, bjorn.andersson@linaro.org,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org,
	Stephen Boyd <swboyd@chromium.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm-owner@vger.kernel.org
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
	<20191101163136.GC3603@willie-the-truck>
	<af7e9a14ae7512665f0cae32e08c8b06@codeaurora.org>
	<20191101172508.GB3983@willie-the-truck>
	<119d4bcf5989d1aa0686fd674c6a3370@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <119d4bcf5989d1aa0686fd674c6a3370@codeaurora.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Mon, 04 Nov 2019 16:28:36 +0000
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm-owner@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, Nov 01, 2019 at 11:01:59PM +0530, Sai Prakash Ranjan wrote:
> >>> What's the plan for getting this merged? I'm not happy taking the
> >>> firmware
> >>> bits without Andy's ack, but I also think the SMMU changes should go via
> >>> the IOMMU tree to avoid conflicts.
> >>>
> >>> Andy?
> >>>
> >>
> >>Bjorn maintains QCOM stuff now if I am not wrong and he has already
> >>reviewed
> >>the firmware bits. So I'm hoping you could take all these through IOMMU
> >>tree.
> >
> >Oh, I didn't realise that. Is there a MAINTAINERS update someplace? If I
> >run:
> >
> >$ ./scripts/get_maintainer.pl -f drivers/firmware/qcom_scm-64.c
> >
> >in linux-next, I get:
> >
> >Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> >linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
> >linux-kernel@vger.kernel.org (open list)
> >
> 
> It hasn't been updated yet then. I will leave it to Bjorn or Andy to comment
> on this.

The rumors of my demise have been greatly exaggerated.  All kidding aside, I
ack'ed both.  Bjorn will indeed be coming on as a co-maintener at some point.
He has already done a lot of yeomans work in helping me out the past 3 months.

Andy

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
