Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFDDB71D9
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 05:18:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A544CFD8;
	Thu, 19 Sep 2019 03:18:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4FB39F51
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 03:18:30 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07A3381A
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 03:18:30 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D30946141C; Thu, 19 Sep 2019 03:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568863109;
	bh=QsV/8fQdOXJe1K2A9PF7ZFpmLj/7hgXHE/kdC5ZdvrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jKQfI+tvCa6szr1MwLs9kgRzRydN4ZMHgSp0irIcw2NAA1qCNGRVw79A7UKZmLD/U
	MTL72gi0jyfWJVlRVSr2SxGn8xweI7870oC8l5dAKQ0P28QBW3NTk5n5NAtTDtx/o0
	B22o7hnRcqKlwWE+A0YcdTcaaL77gHmZdGenEvKA=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 07A3360767;
	Thu, 19 Sep 2019 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568863109;
	bh=QsV/8fQdOXJe1K2A9PF7ZFpmLj/7hgXHE/kdC5ZdvrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jKQfI+tvCa6szr1MwLs9kgRzRydN4ZMHgSp0irIcw2NAA1qCNGRVw79A7UKZmLD/U
	MTL72gi0jyfWJVlRVSr2SxGn8xweI7870oC8l5dAKQ0P28QBW3NTk5n5NAtTDtx/o0
	B22o7hnRcqKlwWE+A0YcdTcaaL77gHmZdGenEvKA=
MIME-Version: 1.0
Date: Thu, 19 Sep 2019 08:48:28 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
In-Reply-To: <20190919002501.GA20859@builder>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
	<1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org>
	<20190919002501.GA20859@builder>
Message-ID: <a45e8fb6fe1a8cc914fedbfac65af009@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>
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

On 2019-09-19 05:55, Bjorn Andersson wrote:
> In the transition to this new design we lost the ability to
> enable/disable the safe toggle per board, which according to Vivek
> would result in some issue with Cheza.
> 
> Can you confirm that this is okay? (Or introduce the DT property for
> enabling the safe_toggle logic?)
> 

Hmm, I don't remember Vivek telling about any issue on Cheza because of 
this logic.
But I will test this on Cheza and let you know.

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
