Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAEF276E
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 06:56:34 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7EA3C52;
	Thu,  7 Nov 2019 05:56:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9AC4B43
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2C09D710
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:56:28 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e17so1009456otk.6
	for <iommu@lists.linux-foundation.org>;
	Wed, 06 Nov 2019 21:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=384NhWXS6hyuU3CrnbFQGK7zYahu2OSuAafYFZok/GY=;
	b=ALQB/XyVc7B5EJqmTqKtC1ivXh3QHthxsqqvHDFO4J8EggG7OX55reyqRG+5UItmIr
	FibbXT1F85aFPWkvP04Q6/rHkuG4qO/vLoD7jKXvT3g6OU0Fg5vsyAiVT/rELL23aVhG
	VNXVHgVKROBA0xTVEKnkH7Ul+J1v506Zn6pHmUhMdLlOMSK6E+nYA0GqGAXq0xijxxR6
	kXjeMx9zRWuCxIDA2SYewLY2VkvX359xdEzVXWX2C0/QvSMFXulCxWyc57qAgHmoQzk0
	k/VLHybR8vZXfYI7pEOyzLz9qK88VUlsVRt8ecr8XhfBhxjfsYumWR7L8nHqqpo4aA3K
	Hv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=384NhWXS6hyuU3CrnbFQGK7zYahu2OSuAafYFZok/GY=;
	b=lHrpvOmpuBcqhjDal7qbz2eEp1GwNMQfSTaWOGWUjFWCVJM/U/nHl6sPH6Bzb7/Xw9
	gUwMHpX+PoMcBcze8q88ARNdb8LFrGHlNYsClWqzeYJVe0cbZkcBqCQVYfBR6rQHONlv
	hUeUaLxOHeVfQMisT7LsGsnGEJADkg28qqjijx06Q5NlxsZFpUn2f7EOQdZOZPXH0mNy
	jMNcEedgDE/MPQosNEKMg/DtrOXGPURbERBVS5mglxnM0weYQ0/INGevJZOZKeFqCdFh
	zIwGjYQTZuprF7QWRcpqC6OvfbgLQ1A+FwlgVxasEbydVGLDCWE7eczO30Aixlft3OFv
	N8rw==
X-Gm-Message-State: APjAAAUlD7ETxqicjmT+dEnt40IhKRSmcov6FIg1vRiEAVxZtXDIL7l5
	/T3/NYiGuiL/nLO30TA5XWHUk1rogRhAryIjWBQNQQ==
X-Google-Smtp-Source: APXvYqwE5cMZ/VONPPJ2zbPPDhCLvPbRf+ga6RQbpjxRNgWTVnxUx51Coq2BSPJianYSV7WfGrYJ85IK1/yswKZdMGw=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr1378956otn.225.1573106186955; 
	Wed, 06 Nov 2019 21:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20191030145112.19738-1-will@kernel.org>
	<6e457227-ca06-2998-4ffa-a58ab171ce32@arm.com>
	<20191030155444.GC19096@willie-the-truck>
	<CAGETcx9ogWQC1ZtnS_4xC3ShqBpuRSKudWEEWC22UZUEhdEU4A@mail.gmail.com>
	<20191031193758.GA2607492@lophozonia>
	<CAGETcx-MuMVvj0O-MFdfmLADEq=cQY_=x+irvhgwHhG4VeeSdg@mail.gmail.com>
	<20191101114148.GA2694906@lophozonia>
	<20191101122825.GA318@e121166-lin.cambridge.arm.com>
	<CAGETcx_U1huHHT=_xo6ArTWpmKMkr=rAy4ceoVUQv6XZGEDA_w@mail.gmail.com>
	<20191104114312.GA15105@e121166-lin.cambridge.arm.com>
In-Reply-To: <20191104114312.GA15105@e121166-lin.cambridge.arm.com>
Date: Wed, 6 Nov 2019 21:55:50 -0800
Message-ID: <CAGETcx_0kwQTjM2BkW__ux8kRvazR-PuX4Hcp4fP_97QRLSkTQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DOS_RCVD_IP_TWICE_B,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>
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
From: Saravana Kannan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Nov 4, 2019 at 3:43 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Fri, Nov 01, 2019 at 02:26:05PM -0700, Saravana Kannan wrote:
> > On Fri, Nov 1, 2019 at 5:28 AM Lorenzo Pieralisi
> > <lorenzo.pieralisi@arm.com> wrote:
> > >
> > > On Fri, Nov 01, 2019 at 12:41:48PM +0100, Jean-Philippe Brucker wrote:
> > >
> > > [...]
> > >
> > > > > > I'm also wondering about ACPI support.
> > > > >
> > > > > I'd love to add ACPI support too, but I have zero knowledge of ACPI.
> > > > > I'd be happy to help anyone who wants to add ACPI support that allows
> > > > > ACPI to add device links.
> > > >
> > > > It's not as generic as device-tree, each vendor has their own table to
> > > > describe the IOMMU topology. I don't see a nice way to transpose the
> > > > add_links() callback there. Links need to be created either in a common
> > > > path (iommu_probe_device()) or in the APCI IORT driver.
> > >
> > > We can create a generic stub that calls into respective firmware
> > > handling paths (eg iort_dma_setup() in acpi_dma_configure()).
> > >
> > > There are three arches booting with ACPI so stubbing it out in
> > > specific firmware handlers is not such a big deal, less generic
> > > sure, but not catastrophically bad.
> >
> > Ok, good to know.
> >
> > > Obviously this works for IOMMU masters links
> >
> > It's unclear to me what you are referring to here and it's throwing me
> > off on the rest of the email.
> >
> > Did you mean to say "IOMMU master's links"? As in the bus masters
> > whose accesses go through IOMMUs? And "links" as in device links?
> >
> > OR
> >
> > Do you mean device links from bus master devices to IOMMUs here?
>
> I meant associating endpoints devices to the IOMMU they are connected
> to.
>
> In DT you do it through "iommus", "iommu-map" properties, in ACPI
> it is arch specific, doable nonetheless through ACPI (IORT on ARM)
> static tables data.
>
> > > - for resources
> > > dependencies (eg power domains) it deserves some thought, keeping in
> > > mind that IOMMUs are static table entries in ACPI and not device objects
> > > so they are not even capable of expressing eg power resources and
> > > suchlike.
> >
> > If you can reword this sentence for me with more context or split it
> > into separate sentences, I'd appreciate that very much. I'd help me
> > understand this better and allow me to try to help out.
>
> In ACPI (at least on ARM but on x86 I suspect that's the same story with
> the DMAR table) an SMMU is presented in FW as an entry in a static
> table (eg IORT on ARM). I noticed that your patch series takes into
> account for instance eg clock dependencies in DT; this way the OS knows
> the clock(s) the SMMU depends on to be activated.
>
> In ACPI there is not a notion of "clock" (hopefully - unless someone
> sneaked that in using _DSD properties) but rather every device in the
> ACPI namespace (which is part of tables containing code that needs the
> ACPI interpreter to be used such as SSDT/DSDT - it is AML code) has ACPI
> objects describing power resources (ie ACPI specification 6.3, 7.2).
>
> The SMMU, since it is not itself an ACPI object in the ACPI namespace
> but rather an entry in a static ACPI table (IORT on ARM), can't have
> PowerResource object in it which means that at the moment there is no
> way you can detect a dependency on other power resources to be ON to
> build the device links you require to sort out the probe dependencies,
> which I *assume* that's the reason why you require to detect
> clock dependencies in DT.
>
> Maybe it is not even needed at all but in case it is I was giving
> a heads-up to say that clocks (or rather an all encompassing "power
> resource" dependency) dependencies in ACPI to build an SMMU as
> a module are not straightforward and most certainly will require
> firmware specifications updates.
>
> *Hopefully* in the short term all you need to detect is how endpoint
> devices are connected to an IOMMU and build device links to describe
> that probe dependency, if we need to throw power management into
> the picture there is more work to be done.
>
> I hope that's clearer, if it is not please let me know and I will
> try to be more precise.

Thanks for the detailed explanation and context Lorenzo. I understand
it better now.

-Saravana
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
