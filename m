Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A62190B52
	for <lists.iommu@lfdr.de>; Tue, 24 Mar 2020 11:43:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59D4987FA1;
	Tue, 24 Mar 2020 10:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ccASN9FSjRH; Tue, 24 Mar 2020 10:43:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A9E8987F30;
	Tue, 24 Mar 2020 10:43:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A655C1D89;
	Tue, 24 Mar 2020 10:43:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79FF5C0177
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72F702040F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUQ9elFP8jwb for <iommu@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 10:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 65ABF2034F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:43:10 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 049EE208C3;
 Tue, 24 Mar 2020 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585046590;
 bh=e+fMIwGNwq2beGOSfZj3r5yBkIPwIcRKL0eYkApPFb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K+qKqSE3qcGqcbMQcCYeT1g3fyXhB8jPkSB7dvCTZgow8dVsJReoNWoQakJ63GReE
 XLFw3gjfkK3WaQOcJXlyf192cAg3YZRUVBKXtghqiR01SN/LFwJT3SK3pECDnzjUKa
 qJmzDt+u7bmYNluiKrvC7K77DUMjyM7bFM0ECT3g=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jGh1Y-00FEMD-9P; Tue, 24 Mar 2020 10:43:08 +0000
Date: Tue, 24 Mar 2020 10:43:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: arm-smmu-v3 high cpu usage for NVMe
Message-ID: <20200324104307.57d2cde0@why>
In-Reply-To: <0e00de15-596a-d342-f3cb-e19c389294e6@huawei.com>
References: <20190821151749.23743-1-will@kernel.org>
 <b2a6e26d-6d0d-7f0d-f222-589812f701d2@huawei.com>
 <20200318205313.GB8094@willie-the-truck>
 <c6ab8020-dc06-0c7d-7a41-e792d90f97ba@huawei.com>
 <20200319184349.GA1697676@myrica>
 <c9ebe17d-66b8-1b8c-cc2c-5be0bd1501a7@huawei.com>
 <20200320111842.GD1702630@myrica>
 <b412fc9c-6266-e320-0769-f214d7752675@huawei.com>
 <5198fcffc8ad6233e0274ebff9e9aa5f@kernel.org>
 <cca67355-672d-81c5-3d37-72004eb8f14f@huawei.com>
 <dd375cf6bffacd82174c84a4c7d46283@kernel.org>
 <0e00de15-596a-d342-f3cb-e19c389294e6@huawei.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: john.garry@huawei.com, jean-philippe@linaro.org,
 will@kernel.org, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 thunder.leizhen@huawei.com, ming.lei@redhat.com, julien.thierry.kdev@gmail.com,
 mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Ming Lei <ming.lei@redhat.com>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
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

On Tue, 24 Mar 2020 09:18:10 +0000
John Garry <john.garry@huawei.com> wrote:

> On 23/03/2020 09:16, Marc Zyngier wrote:
> 
> + Julien, Mark
> 
> Hi Marc,
> 
> >>> Time to enable pseudo-NMIs in the PMUv3 driver...
> >>>
> >>
> >> Do you know if there is any plan for this?
> > 
> > There was. Julien Thierry has a bunch of patches for that [1], but they > needs
> > reviving.
> > 
> 
> So those patches still apply cleanly (apart from the kvm patch, which
> I can skip, I suppose) and build, so I can try this I figure. Is
> there anything else which I should ensure or know about? Apart from
> enable CONFIG_ARM64_PSUEDO_NMI.

You need to make sure that your firmware sets SCR_EL3.FIQ to 1. My D05
has it set to 0, preventing me from being able to use the feature
(hint, nudge... ;-).

	M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
