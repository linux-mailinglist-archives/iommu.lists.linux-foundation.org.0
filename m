Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 46231A35A4
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 13:25:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 431A35DD5;
	Fri, 30 Aug 2019 11:25:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E3A55D0B
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 11:24:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B21FEC
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 11:24:54 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E3CEB2186A;
	Fri, 30 Aug 2019 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567164294;
	bh=SvasqYwjy74kYLWC3urWZ172/5QQQoPGYM5uJ5DNOoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5SggZ8Y48Wxv92rKRzbCftQlbg0ez/lKSoqMLCdPUfo3NRcN76/6dYUQnTOdZsS4
	5iI/7p+kIHv2J1jhvwSCRmf6M/dc9iF5R3YjK8O3+kgiH0ENNxGEuzn40EHk9kPpWg
	9/qWtu7C6usrQMiG6FXeZGz9Dg8y8QCkC2E/RG8Y=
Date: Fri, 30 Aug 2019 12:24:49 +0100
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Big batch of updates for 5.4
Message-ID: <20190830112449.hjnjphwwiv33o7rh@willie-the-truck>
References: <20190823145440.2b7ejsnglz2bju5k@willie-the-truck>
	<20190828214229.cuqme6acfqxpgvqk@willie-the-truck>
	<20190830102939.GA29382@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830102939.GA29382@8bytes.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe@linaro.org, iommu@lists.linux-foundation.org,
	robin.murphy@arm.com
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

On Fri, Aug 30, 2019 at 12:29:39PM +0200, Joerg Roedel wrote:
> On Wed, Aug 28, 2019 at 10:42:30PM +0100, Will Deacon wrote:
> > On Fri, Aug 23, 2019 at 03:54:40PM +0100, Will Deacon wrote:
> > > Please pull these ARM SMMU updates for 5.4. The branch is based on the
> > > for-joerg/batched-unmap branch that you pulled into iommu/core already
> > > because I didn't want to rebase everything onto -rc3. The pull request
> > > was generated against iommu/core.
> > 
> > Just a gentle nudge on this pull request, since it would be nice to have
> > it sit in -next for a bit before the merge window opens.
> > 
> > Please let me know if you need anything more from me.
> 
> It is pulled and pushed out now, thanks Will.

Cheers, Joerg and sorry for nagging. Next week is going to be crazy for
me, so I'm trying to get my 5.4 queue resolved early.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
