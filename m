Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 877008E95A
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 12:56:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 76D7CE94;
	Thu, 15 Aug 2019 10:55:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2F8D8D1A
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 10:55:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DDF9067F
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 10:55:56 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 266BA21744;
	Thu, 15 Aug 2019 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565866556;
	bh=7cf4u3cY/l0YA9m9qv/SdhxS5YxC0bDqvVYfflUHsl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdK2muyFm8nJoIib88QYXlUtuWPQjraO7qRKkgYePLXqu7zRAu8CWQP8blWFK+Vkk
	5Jd+6oSmObvX5FAiL8BV2Ls2FBN4h1pitzYI91Xw+CAkNkvJ5yh/JbARLLgtwxBjyS
	RtFyOm/+pNSIMLnK6LNa+etZmvUQ2z3p+/NdoqvY=
Date: Thu, 15 Aug 2019 11:55:52 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 00/15] Arm SMMU refactoring
Message-ID: <20190815105551.zqn45le3kd3f3jee@willie-the-truck>
References: <cover.1565369764.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1565369764.git.robin.murphy@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

Hi Robin,

On Fri, Aug 09, 2019 at 06:07:37PM +0100, Robin Murphy wrote:
> This is a big refactoring of arm-smmu in order to help cope with the
> various divergent implementation details currently flying around. So
> far we've been accruing various quirks and errata workarounds within
> the main flow of the driver, but given that it's written to an
> architecture rather than any particular hardware implementation, after
> a point these start to become increasingly invasive and potentially
> conflict with each other.
> 
> These patches clean up the existing quirks handled by the driver to
> lay a foundation on which we can continue to add more in a maintainable
> fashion. The idea is that major vendor customisations can then be kept
> in arm-smmu-<vendor>.c implementation files out of each others' way.
> 
> A branch is available at:
> 
>   git://linux-arm.org/linux-rm  iommu/smmu-impl
> 
> which I'll probably keep tweaking until I'm happy with the names of
> things; I just didn't want to delay this initial posting any lomnger.

Thanks, this all looks pretty decent to me. I've mainly left you a bunch
of nits (hey, it's a refactoring series!) but I did spot one pre-existing
howler that we should address.

When do you think you'll have stopped tweaking this so that I can pick it
up? I'd really like to see it in 5.4 so that others can start working on
top of it.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
