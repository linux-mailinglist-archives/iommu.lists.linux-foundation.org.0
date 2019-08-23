Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C69AA79
	for <lists.iommu@lfdr.de>; Fri, 23 Aug 2019 10:37:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 602C2D98;
	Fri, 23 Aug 2019 08:37:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15885B0B
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:37:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0D4CE6
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:37:17 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 599C922CEC;
	Fri, 23 Aug 2019 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566549437;
	bh=niV7neuzYojJdHn0ExBeb264ApqQ6IcTCNkFCeK4d+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lo91WDqMkrMHkBSpDl1bj3ZG5vGkzmlVPsKy2PaOuAhB8vy9ujjPpFGPC4MW4h1cU
	FqIft2qhTQzKucvJeqF4/BmwPJnFE6ZTbwpi6UEqDCdTaOKZIBGoqdX2OJd+jeeDPo
	mCmk/FFGHESA6BxwLZTCKFbsPfstWev8YNa/jqlg=
Date: Fri, 23 Aug 2019 09:37:13 +0100
From: Will Deacon <will@kernel.org>
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v3 0/2] improve the concurrency of
	arm_smmu_atc_inv_domain()
Message-ID: <20190823083712.ggzmw3rcodwyhmlf@willie-the-truck>
References: <20190823024551.24448-1-thunder.leizhen@huawei.com>
	<20190823075026.pwlx33e4crh3m6tn@willie-the-truck>
	<7e28e1ce-2cc3-3c7f-45c7-e7de334c6976@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e28e1ce-2cc3-3c7f-45c7-e7de334c6976@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Fri, Aug 23, 2019 at 04:06:52PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2019/8/23 15:50, Will Deacon wrote:
> > On Fri, Aug 23, 2019 at 10:45:49AM +0800, Zhen Lei wrote:
> >> v2 --> v3:
> >> As Will Deacon's suggestion, I changed the lock type of
> >> arm_smmu_domain.devices_lock from spinlock_t to rwlock_t, and I saw that the
> >> performance is all right. And further use nr_ats_masters to quickly check have
> >> no obvious effect, so I drop it.
> > 
> > :/
> > 
> > I already sent two versions of a series fixing this without any locking at
> > all on the ->unmap() path, and you were on cc. I've also queued that stuff
> > up.
> > 
> > Did you not receive my patches?
> Sorry, my message filter setting is a bit wrong, must contains
> "linux-kernel@vger.kernel.org", I have corrected it.

Ha, sounds like the opposite of my email filter ;)

> > v1: https://lists.linuxfoundation.org/pipermail/iommu/2019-August/038306.html
> > v2: https://lists.linuxfoundation.org/pipermail/iommu/2019-August/038374.html
> OK, I will test it when it's my turn to use the board.

Thanks, although I plan to send it to Joerg today so any changes will need
to go on top. Does your testing involve ATS, or just non-ATS devices? I've
tested the latter locally, although I haven't looked at the performance
since most of the patches are trying to fix the enable/disable ordering.

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
