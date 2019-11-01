Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019BEBA62
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 00:35:01 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DBEBE38;
	Thu, 31 Oct 2019 23:34:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7787EDC2
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 23:34:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 62B30876
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 23:34:52 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id v84so2845315ywc.4
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HGoHxR3NtdOTWlkVc1ys+9ogvs4xOCVkWZMzaTeK/Gs=;
	b=HQtder84SXthDEQwBji6Wsy9VT2+/SRQYc+S+MeUTDlOxw0hFW8bqJ+a+X8snz2dNE
	7FIAiW6POXyLpwHx6hjXhQAS+UckZFmPFYlzqq0+qdD+iLJHFo7htSHoGX4OCE6+5r8+
	aM09IhSLRdsCEiQvkk4r41k8/aWnIH6pSu5yBWWzBXDio1HAtxI98rlyRCMNF1jBlyBs
	dc5nblXJB+jTL0NeLiM1MHXqd/P2LhrgetHsgw4y1qKNaOXwlPdB5ULbrhEEaObpp3yl
	1hPiQbBuPAQVIVwOYGE6FENyP0Z2lfgGeYHyxVlB5iEfu32Htn6e50xrjPTn/RbmDvvr
	vYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HGoHxR3NtdOTWlkVc1ys+9ogvs4xOCVkWZMzaTeK/Gs=;
	b=ee6RO7R1WkNmwuUB/iojHcFQkOm5eQ6EXxpt1GbW+dNR7R0mkk2+qGRkEZzkWHCD6I
	2LIPrrgnA1Yh5ex/u0eY1QvYPi8C9OeL9kJuNzl1/8S+DzHJj5fBTgG57XXwIQPHX4mW
	mVPDeDfvhyijtYrXmR1RG2l1Sn6AAy928BXWAobM/m7ea1jz7OkbrAh38m8Goy1PMEf7
	ugIJ0cntEuDxHJL18XqvYMtcxAp9/zumts1UzYnp5B6zYo3orFyrn89XAgox/7czOVlO
	b+Y2D69rzjZVHHtTRIJSBp2zyNQ4iBVdzz09P2qjPt97/Pzf6JHqZmJLpdgoAFbSTvlC
	J86Q==
X-Gm-Message-State: APjAAAUKyGkXZiaFPDHDCQ6bGTfmGgcsTgtz7LV6GLwXAGB5KEnZCyj4
	NjLCm/KoB4AW4rWnXSMZqBFs+34YX6O790w7iYk0Cx1M
X-Google-Smtp-Source: APXvYqyq4Hka8TmkQc4lrPzGiOEbFndI88qsPrqnNeYGuBIjsrcN16HG6GchhV9oD/01h4+w5hxHq7OrDp4ymWiFJ1U=
X-Received: by 2002:a9d:3a3:: with SMTP id f32mr6914486otf.231.1572564890313; 
	Thu, 31 Oct 2019 16:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191030145112.19738-1-will@kernel.org>
	<6e457227-ca06-2998-4ffa-a58ab171ce32@arm.com>
	<20191030155444.GC19096@willie-the-truck>
	<CAGETcx9ogWQC1ZtnS_4xC3ShqBpuRSKudWEEWC22UZUEhdEU4A@mail.gmail.com>
	<20191031193758.GA2607492@lophozonia>
In-Reply-To: <20191031193758.GA2607492@lophozonia>
Date: Thu, 31 Oct 2019 16:34:14 -0700
Message-ID: <CAGETcx-MuMVvj0O-MFdfmLADEq=cQY_=x+irvhgwHhG4VeeSdg@mail.gmail.com>
Subject: Re: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DOS_RCVD_IP_TWICE_B,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
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

On Thu, Oct 31, 2019 at 12:38 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Hi Saravana, Will,
>
> On Wed, Oct 30, 2019 at 05:57:44PM -0700, Saravana Kannan via iommu wrote:
> > > > > Obviously you need to be careful about using IOMMU drivers as modules,
> > > > > since late loading of the driver for an IOMMU serving active DMA masters
> > > > > is going to end badly in many cases. On Android, we're using device links
> > > > > to ensure that the IOMMU probes first.
> > > >
> > > > Out of curiosity, which device links are those? Clearly not the RPM links
> > > > created by the IOMMU drivers themselves... Is this some special Android
> > > > magic, or is there actually a chance of replacing all the
> > > > of_iommu_configure() machinery with something more generic?
> > >
> > > I'll admit that I haven't used them personally yet, but I'm referring to
> > > this series from Saravana [CC'd]:
> > >
> > > https://lore.kernel.org/linux-acpi/20190904211126.47518-1-saravanak@google.com/
> > >
> > > which is currently sitting in linux-next now that we're upstreaming the
> > > "special Android magic" ;)
>
> Neat, I'm trying to do the same for virtio-iommu. It needs to be modular
> because it depends on the virtio transport, which distributions usually
> build as a module. So far I've been managing the device links in
> virtio-iommu's add_device() and remove_device() callbacks [1]. Since it
> relies on the existing probe deferral, I had to make a special case for
> virtio-iommu to avoid giving up after initcalls_done [2].
>
> Currently buggy, it explodes on the second modprobe.
>
> [1] http://jpbrucker.net/git/linux/commit/?h=virtio-iommu/module-2019-10-31&id=f72978be18cb52eaa2d46dc762711bacbfab5039
> [2] http://jpbrucker.net/git/linux/commit/?h=virtio-iommu/module-2019-10-31&id=f5fe188bb7fde33422ef08b9aad956dc3c77ec39
>
> [...]
> > Wrt IOMMUs, the only missing piece in upstream is a trivial change
> > that does something like this in drivers/of/property.c
> >
> > +static struct device_node *parse_iommus(struct device_node *np,
> > +                                        const char *prop_name, int index)
> > +{
> > +        return parse_prop_cells(np, prop_name, index, "iommus",
> > +                                "#iommu-cells");
> > +}
>
> The 'iommus' property only applies to platform devices,

An early version of this patch series was limited to platform device,
but that's not true with the version that Will pointed to and was
merged into driver-core-next. The iommu parsing and creating device
links applies to all devices that use DT. That's why this code is in
of/property.c opposed to of/platform.c.

> do you have any
> plan for PCI?  PCI devices generally don't have a DT node. Only their root
> bridge has a node, with an 'iommu-map' property instead of 'iommus', so
> I don't think add_links() would get called for them.

I looked into the iommu-map property and it shouldn't be too hard to
add support for it. Looks like we can simply hold off on probing the
root bridge device till all the iommus in its iommu-map are probed and
we should be fine.

> I'm also unsure about distro vendors agreeing to a mandatory kernel
> parameter (of_devlink). Do you plan to eventually enable it by default?
>
> > static const struct supplier_bindings of_supplier_bindings[] = {
> >         { .parse_prop = parse_clocks, },
> >         { .parse_prop = parse_interconnects, },
> >         { .parse_prop = parse_regulators, },
> > +        { .parse_prop = parse_iommus, },
> >         {},
> > };
> >
> > I plan to upstream this pretty soon, but I have other patches in
> > flight that touch the same file and I'm waiting for those to get
> > accepted. I also want to clean up the code a bit to reduce some
> > repetition before I add support for more bindings.
>
> I'm also wondering about ACPI support.

I'd love to add ACPI support too, but I have zero knowledge of ACPI.
I'd be happy to help anyone who wants to add ACPI support that allows
ACPI to add device links.

> IOMMU already has a sort of
> canonical code path that links endpoints to their IOMMU
> (iommu_probe_device()), after the firmware descriptions have been parsed.
> So if we created the device links in the iommu core, for example
> iommu_bus_notifier(), we would support all firmware interface flavors.
> Otherwise we'll have to create those device links in the IORT driver as
> well (plus DMAR and IVRS if they want it).

IOMMU driver/framework or whoever else can create device links as
necessary. That's not mutually exclusive to the firmware adding device
links (the device links APIs handle this nicely). While device probe
ordering is one benefit of my patch series, that's not all of it
though. It also deals with making sure suppliers known when they can
clean up the boot state of their device even when the drivers for all
their consumers are loaded as modules (so late initcall won't work). I
can go into more details on this if needed, but that latter part is
not very relevant in this context and you can find most of the details
in my patch series/documentation I added.

Thanks,
Saravana
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
