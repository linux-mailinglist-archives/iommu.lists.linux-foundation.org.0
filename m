Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094B57CB7
	for <lists.iommu@lfdr.de>; Thu, 27 Jun 2019 09:05:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81B11CC6;
	Thu, 27 Jun 2019 07:05:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C2C3DB7D
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 07:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 501E23D0
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 07:05:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E9ECA60E57; Thu, 27 Jun 2019 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1561619118;
	bh=4sMYL/vEnFR3JJT1yrTXKeeZBriSZ99gcmBVQPeanvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e/PJdizeuVqUAN3aRZQrNdNKP83BlAgHiacq6m2Aw+J7XZwjk3NKYbMez+4P28C7v
	aeP7wIu+x8boN9BAf2aEMR29ePoZykHoBVekoBspNkvzP4bEfZnpGcpHhSXje9zCng
	cnjokAgK8+Csf0fiuRyObg7GN7IrLiU7xsxjEdhg=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: vivek.gautam@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 59AD76038E
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1561619117;
	bh=4sMYL/vEnFR3JJT1yrTXKeeZBriSZ99gcmBVQPeanvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ou36ma9pIfK8dHNclgs1noT/MtX+sA0jszvw2qqktBI0k/jiXntFE9wnYEXwFXhCz
	eV/0NdpCw1OP/InYN6MODkWArQCj05X6ScVlHBn1eTpLiS3WIrm/cjYJjoR5neJevQ
	wLMRqjxMU7DZOsP7gPkKNAuzGhZjgi3cRU+llTmI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59AD76038E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f50.google.com with SMTP id e3so5980795edr.10
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 00:05:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXZVr1BMgC030btuDoxrE2GXSU/RBcUjg7T2cbAGSoJcUtjfAbh
	VCtqpPfdlfNcvdetiFMaGIzb2sYWhdhx9wnAYWs=
X-Google-Smtp-Source: APXvYqy6/T0+BAERf4oMw5abJsW76giuCjeiXeBDMRRBEFACHq6VcztnGhX1IL9uJkMy8ums6cUkmiXVqPScbQRjh1Y=
X-Received: by 2002:a17:906:3c1:: with SMTP id
	c1mr1624686eja.221.1561619115146; 
	Thu, 27 Jun 2019 00:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-4-vivek.gautam@codeaurora.org>
	<20190614040520.GK22737@tuxbook-pro>
	<3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
	<20190618175218.GH4270@fuggles.cambridge.arm.com>
	<CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
	<20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
	<CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
	<20190625133924.fqq3y7p3i3fqem5p@willie-the-truck>
	<CAFp+6iH-KzX7x1j8AAuKJcOP6v=fyP-yLvaeeE_Ly3oueu_ngg@mail.gmail.com>
	<20190626144844.key3n6ueb6skgkp4@willie-the-truck>
In-Reply-To: <20190626144844.key3n6ueb6skgkp4@willie-the-truck>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Thu, 27 Jun 2019 12:35:02 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGvUd6QhmEO0rSSXAZnYt3x_5G0HuGUJYZ203W1_ER+=w@mail.gmail.com>
Message-ID: <CAFp+6iGvUd6QhmEO0rSSXAZnYt3x_5G0HuGUJYZ203W1_ER+=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
	wait-for-safe logic
To: Will Deacon <will@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Will Deacon <will.deacon@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	David Brown <david.brown@linaro.org>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jun 26, 2019 at 8:18 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Jun 26, 2019 at 12:03:02PM +0530, Vivek Gautam wrote:
> > On Tue, Jun 25, 2019 at 7:09 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Jun 25, 2019 at 12:34:56PM +0530, Vivek Gautam wrote:
> > > > On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
> > > > > Instead, I think this needs to be part of a separate file that is maintained
> > > > > by you, which follows on from the work that Krishna is doing for nvidia
> > > > > built on top of Robin's prototype patches:
> > > > >
> > > > > http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl
> > > >
> > > > Looking at this branch quickly, it seem there can be separate implementation
> > > > level configuration file that can be added.
> > > > But will this also handle separate page table ops when required in future.
> > >
> > > Nothing's set in stone, but having the implementation-specific code
> > > constrain the page-table format (especially wrt quirks) sounds reasonable to
> > > me. I'm currently waiting for Krishna to respin the nvidia changes [1] on
> > > top of this so that we can see how well the abstractions are holding up.
> >
> > Sure. Would you want me to try Robin's branch and take out the qualcomm
> > related stuff to its own implementation? Or, would you like me to respin this
> > series so that you can take it in to enable SDM845 boards such as, MTP
> > and dragonboard to have a sane build - debian, etc. so people benefit
> > out of it.
>
> I can't take this series without Acks on the firmware calling changes, and I
> plan to send my 5.3 patches to Joerg at the end of the week so they get some
> time in -next. In which case, I think it may be worth you having a play with
> the branch above so we can get a better idea of any additional smmu_impl hooks
> you may need.

Cool. I will play around with it and get something tangible and meaningful.

>
> > Qualcomm stuff is lying in qcom-smmu and arm-smmu and may take some
> > time to stub out the implementation related details.
>
> Not sure I follow you here. Are you talking about qcom_iommu.c?

That's right. The qcom_iommu.c solved a different issue of secure context bank
allocations, when Rob forked out this driver and reused some of the
arm-smmu.c stuff.

We will take a look at that once we start adding the qcom implementation.

Thanks
Vivek

>
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
