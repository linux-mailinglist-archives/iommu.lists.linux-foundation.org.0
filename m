Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99BC1FE5
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 13:21:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3786A173D;
	Mon, 30 Sep 2019 11:21:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4B5161737
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 11:21:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 096147FB
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 11:21:53 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C846B206BB;
	Mon, 30 Sep 2019 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569842512;
	bh=XK2t7THQT0Mdaq4LrhC1eZVsJhx+lzPpETJg3foBo1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEydkTneGLf8RUEFEfjmnOyBlP3MImuHanTAhl+tQwOEn501QUJzvi49Sc0W45HZr
	4d4iMCQEalm8gNu+VeNVriBG9rIQD4pgRbHY2hRD4Jyhrw9SCBQ0J4iSU6wJACj5+s
	CVLbEI8jJQXyB/PuqaaidGhARXSNVVnr72jEzaL8=
Date: Mon, 30 Sep 2019 12:21:48 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/4] iommu/arm-smmu: Remove arm_smmu_flush_ops
Message-ID: <20190930112148.5ismf35ph22hl75z@willie-the-truck>
References: <cover.1568820087.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1568820087.git.robin.murphy@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On Wed, Sep 18, 2019 at 05:17:47PM +0100, Robin Murphy wrote:
> Off the back of Will's iommu_flush_ops work, here's an initial followup
> to replace the temporary solution in arm-smmu with a full conversion.
> Removing teh extra layer of indirection should generally make things a
> good bit more efficient, and rather more readable to boot.

Thanks, I'll queue this for 5.5.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
