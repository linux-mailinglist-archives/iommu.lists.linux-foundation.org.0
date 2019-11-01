Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09AEC760
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 18:19:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4131102D;
	Fri,  1 Nov 2019 17:19:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F816101D
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 17:19:02 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C161466
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 17:19:02 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0032161178; Fri,  1 Nov 2019 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1572628742;
	bh=vay1cC4Y6XG5HFwL0eefjYJon6gcGVMawCFumaTPMQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l+1zCDXLKatvwd7SjcQumNDpR8dXybAZbTOKm+Fav1cRRFOkW0acNq7S96+JTFpxd
	agWBXjrtaXKHQ6ikms4IvJ3zo1AFzrIPdQdPl66ZYi1etAG0ORPUBompNc2Iy+AMfw
	jvglT9ADF8ECBunuI6aFO6SD7Tbj6m+HqKoqhLcM=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id F1FB461065;
	Fri,  1 Nov 2019 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1572628741;
	bh=vay1cC4Y6XG5HFwL0eefjYJon6gcGVMawCFumaTPMQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cLhqmYFGxliSdKkO1EA+sR8KIzjuO5h+4hlvqhyoOHWMF7QaXo27oqt8dx2Pw5luL
	3/njb1LOjlLuEAP4G7jmyQbt0g7/Qb28j/tmjEGVmaPHaPnc+UzU85mP1oD+q6ioMS
	oYLlgRmgLQQteUEEz1idHNTBT3TUFL4bxSqzzEdA=
MIME-Version: 1.0
Date: Fri, 01 Nov 2019 22:49:00 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
In-Reply-To: <20191101163136.GC3603@willie-the-truck>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
	<20191101163136.GC3603@willie-the-truck>
Message-ID: <af7e9a14ae7512665f0cae32e08c8b06@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org, agross@kernel.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	bjorn.andersson@linaro.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-msm-owner@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 2019-11-01 22:01, Will Deacon wrote:
> On Fri, Sep 20, 2019 at 01:34:26PM +0530, Sai Prakash Ranjan wrote:
>> Previous version of the patches are at [1]:
>> 
>> QCOM's implementation of smmu-500 on sdm845 adds a hardware logic 
>> called
>> wait-for-safe. This logic helps in meeting the invalidation 
>> requirements
>> from 'real-time clients', such as display and camera. This 
>> wait-for-safe
>> logic ensures that the invalidations happen after getting an ack from 
>> these
>> devices.
>> In this patch-series we are disabling this wait-for-safe logic from 
>> the
>> arm-smmu driver's probe as with this enabled the hardware tries to
>> throttle invalidations from 'non-real-time clients', such as USB and 
>> UFS.
>> 
>> For detailed information please refer to patch [3/4] in this series.
>> I have included the device tree patch too in this series for someone 
>> who
>> would like to test out this. Here's a branch [2] that gets display on 
>> MTP
>> SDM845 device.
>> 
>> This patch series is inspired from downstream work to handle 
>> under-performance
>> issues on real-time clients on sdm845. In downstream we add separate 
>> page table
>> ops to handle TLB maintenance and toggle wait-for-safe in tlb_sync 
>> call so that
>> achieve required performance for display and camera [3, 4].
> 
> What's the plan for getting this merged? I'm not happy taking the 
> firmware
> bits without Andy's ack, but I also think the SMMU changes should go 
> via
> the IOMMU tree to avoid conflicts.
> 
> Andy?
> 

Bjorn maintains QCOM stuff now if I am not wrong and he has already 
reviewed the firmware bits. So I'm hoping you could take all these 
through IOMMU tree.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
