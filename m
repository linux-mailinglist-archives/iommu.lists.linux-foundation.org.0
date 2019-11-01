Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00511EC6D2
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 17:31:48 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08C35FCB;
	Fri,  1 Nov 2019 16:31:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63909A7F
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 16:31:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 211E687C
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 16:31:42 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0798621855;
	Fri,  1 Nov 2019 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572625902;
	bh=lcwuDtMMVht6znRRW2+vxRC911paPSnMy5ommgfPMo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyGXyw2KNWgeMv/p+9wB4TlQogOYBPuCDvs/wMc3yEFpca+YjfRX24yiOHCWwrYhy
	SGS8W7od9h4yQTvj9ZgCLshp3CPe6la+7U/LLWOsZJWI+9JXZXqE2YacivSJfSoilJ
	MXowa3plebKou/xRmn1lhQyUCPFqgoseP/v/s2GU=
Date: Fri, 1 Nov 2019 16:31:36 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	agross@kernel.org
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
Message-ID: <20191101163136.GC3603@willie-the-truck>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
	iommu@lists.linux-foundation.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Sep 20, 2019 at 01:34:26PM +0530, Sai Prakash Ranjan wrote:
> Previous version of the patches are at [1]:
> 
> QCOM's implementation of smmu-500 on sdm845 adds a hardware logic called
> wait-for-safe. This logic helps in meeting the invalidation requirements
> from 'real-time clients', such as display and camera. This wait-for-safe
> logic ensures that the invalidations happen after getting an ack from these
> devices.
> In this patch-series we are disabling this wait-for-safe logic from the
> arm-smmu driver's probe as with this enabled the hardware tries to
> throttle invalidations from 'non-real-time clients', such as USB and UFS.
> 
> For detailed information please refer to patch [3/4] in this series.
> I have included the device tree patch too in this series for someone who
> would like to test out this. Here's a branch [2] that gets display on MTP
> SDM845 device.
> 
> This patch series is inspired from downstream work to handle under-performance
> issues on real-time clients on sdm845. In downstream we add separate page table
> ops to handle TLB maintenance and toggle wait-for-safe in tlb_sync call so that
> achieve required performance for display and camera [3, 4].

What's the plan for getting this merged? I'm not happy taking the firmware
bits without Andy's ack, but I also think the SMMU changes should go via
the IOMMU tree to avoid conflicts.

Andy?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
