Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F2EC78E
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 18:32:16 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 512111054;
	Fri,  1 Nov 2019 17:32:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28582F27
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 17:32:11 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BEAFA466
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 17:32:10 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8A98361178; Fri,  1 Nov 2019 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1572629530;
	bh=kTFcEII9VQ7VXdQiCsnxkwUwGz79YeOsQ0OeBBkuScg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CQuGptTYAsulci16RTV0J6ipXgQOt0+r11CVNmbWjV5UnJ1guHkvkHDY5F4ndeLjc
	n7jJZlsjj8B6XgwLBfN2YRFUO+zbF12g5jju9xFrfnbfCQf5dulY0bC4Q1n1354F9O
	8IfO8QKu2eooPdbNVMklYrZkO2Ci9spOlLEm5S+g=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id A5A6B6110B;
	Fri,  1 Nov 2019 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1572629519;
	bh=kTFcEII9VQ7VXdQiCsnxkwUwGz79YeOsQ0OeBBkuScg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fQf4WVwFGtfc1Wm6kx1nxc5oXiJWgVWuuikBGSz5IfoXqOJ2OvG24BLxdjkiA3Age
	AO+oLYI4x2+RggoVwq0YVOaogZZM4qq/VW5y4d/mI4TOQFee8FG7cWeus748HT7TYr
	Ukf5AJrLsyYsL8FQ+Em9swSjmWPSsgocl1JP6590=
MIME-Version: 1.0
Date: Fri, 01 Nov 2019 23:01:59 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, bjorn.andersson@linaro.org
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
In-Reply-To: <20191101172508.GB3983@willie-the-truck>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
	<20191101163136.GC3603@willie-the-truck>
	<af7e9a14ae7512665f0cae32e08c8b06@codeaurora.org>
	<20191101172508.GB3983@willie-the-truck>
Message-ID: <119d4bcf5989d1aa0686fd674c6a3370@codeaurora.org>
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

On 2019-11-01 22:55, Will Deacon wrote:
> On Fri, Nov 01, 2019 at 10:49:00PM +0530, Sai Prakash Ranjan wrote:
>> On 2019-11-01 22:01, Will Deacon wrote:
>> > On Fri, Sep 20, 2019 at 01:34:26PM +0530, Sai Prakash Ranjan wrote:
>> > > Previous version of the patches are at [1]:
>> > >
>> > > QCOM's implementation of smmu-500 on sdm845 adds a hardware logic
>> > > called
>> > > wait-for-safe. This logic helps in meeting the invalidation
>> > > requirements
>> > > from 'real-time clients', such as display and camera. This
>> > > wait-for-safe
>> > > logic ensures that the invalidations happen after getting an ack
>> > > from these
>> > > devices.
>> > > In this patch-series we are disabling this wait-for-safe logic from
>> > > the
>> > > arm-smmu driver's probe as with this enabled the hardware tries to
>> > > throttle invalidations from 'non-real-time clients', such as USB and
>> > > UFS.
>> > >
>> > > For detailed information please refer to patch [3/4] in this series.
>> > > I have included the device tree patch too in this series for someone
>> > > who
>> > > would like to test out this. Here's a branch [2] that gets display
>> > > on MTP
>> > > SDM845 device.
>> > >
>> > > This patch series is inspired from downstream work to handle
>> > > under-performance
>> > > issues on real-time clients on sdm845. In downstream we add separate
>> > > page table
>> > > ops to handle TLB maintenance and toggle wait-for-safe in tlb_sync
>> > > call so that
>> > > achieve required performance for display and camera [3, 4].
>> >
>> > What's the plan for getting this merged? I'm not happy taking the
>> > firmware
>> > bits without Andy's ack, but I also think the SMMU changes should go via
>> > the IOMMU tree to avoid conflicts.
>> >
>> > Andy?
>> >
>> 
>> Bjorn maintains QCOM stuff now if I am not wrong and he has already 
>> reviewed
>> the firmware bits. So I'm hoping you could take all these through 
>> IOMMU
>> tree.
> 
> Oh, I didn't realise that. Is there a MAINTAINERS update someplace? If 
> I
> run:
> 
> $ ./scripts/get_maintainer.pl -f drivers/firmware/qcom_scm-64.c
> 
> in linux-next, I get:
> 
> Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
> linux-kernel@vger.kernel.org (open list)
> 

It hasn't been updated yet then. I will leave it to Bjorn or Andy to 
comment on this.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
