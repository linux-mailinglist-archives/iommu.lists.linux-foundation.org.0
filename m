Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4AFF8BDD
	for <lists.iommu@lfdr.de>; Tue, 12 Nov 2019 10:32:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF77B1611;
	Tue, 12 Nov 2019 09:32:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB7A4C90
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 09:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B9B0623
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 09:32:43 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id x21so17959367iol.2
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1fXUpItBgctBzfw6e9xkfJswRTPbxPE6Pnn0RIjmGzc=;
	b=ODHEcHVzDYdwgaSgJoyW32ggcd8kQjEP9GIMEu5MteQu84uFR6bUsnOEOK51eT+/96
	HwWn0VFu79BABV6Gi1BEmUiMUmk8iL4HX4eSzi/Munl9dF1ByxnkbU9WDZ/p7vVtr566
	OQyK4FklNLt4vCpFG0Vt6UHrMOHxVZIGc4KC7s4jOT/j4Fc9cdmPrqcs4Yp8tdZFSxeN
	txZfzaD73EAgDs4riiHZQn5/gaMLvnMHaTmQztddcBO/DREOPikho9Jebbzg/hiKbWGL
	NYD7dN/NRIpHCweOMvyo6UTqf228NWxAxB2Sac+jnVgOAPuEXzcQOcXmFNWk6ZPtt6oq
	5ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1fXUpItBgctBzfw6e9xkfJswRTPbxPE6Pnn0RIjmGzc=;
	b=pzRx0h1tQExSd4I11TI9cCferb72DU9Csx7TyFs9siymhJsjNcYo3pE99MDY1Kpadf
	GOh6h/QsK1avGOmIXlxlUlWpD66hDqJMZy6uDclVScu7vUjeJWTc+2j/xtVtYLCHYmXj
	G6wWaHq13eaps6r9VmGp5QW1YmYmPe4E6GOD+7iYCU757RakRZs5Col5b1G42m+SAilu
	nE6jaE6b5XmXPmH9VH1dr/vg+VhnkiWjaG8AKcAzQFbYxY457JNOGC7BRWNpGNk5jbJy
	Rusu2+ohlTbl5uFbZCMeMeyOB0stpQJEzzqIgFf6z/12lKfcooxIKgjdR4QMTlEZ9WfP
	Gf3g==
X-Gm-Message-State: APjAAAWbyNCf5JpCam/9LmSXFjvk+FjNppfVJLHb7CHbPECqgby7ojfV
	3kobtUtGf/v8taYNVRpsGj10KNWfdXpZTT7boKyYpwPi7Hg=
X-Google-Smtp-Source: APXvYqyni4NuTcajmKiCLMlglfHhaEU4iJSkPhZzCyBrzluRdVMqECoLOaJQFnymxjHoohp5DlHTH+b62FGMXldJNRI=
X-Received: by 2002:a02:13c3:: with SMTP id 186mr4969089jaz.115.1573551162273; 
	Tue, 12 Nov 2019 01:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20191104055852.24395-1-ahuang12@lenovo.com>
	<20191111152203.GJ18333@8bytes.org>
In-Reply-To: <20191111152203.GJ18333@8bytes.org>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Tue, 12 Nov 2019 17:32:31 +0800
Message-ID: <CAHKZfL2Zoj-585mHti3_ZAgUNs0s43T=fxGZYt9cKfhQMnUd3w@mail.gmail.com>
Subject: Re: [PATCH 1/1] iommu/amd: Fix the overwritten exclusion range with
	multiple IVMDs
To: Joerg Roedel <joro@8bytes.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

Hi Joerg,

> On Mon, Nov 11, 2019 at 11:22 PM Joerg Roedel <joro@8bytes.org> wrote:
>
> Hi Adrian,
>
> On Mon, Nov 04, 2019 at 01:58:52PM +0800, Adrian Huang wrote:
> >       2) When set_device_exclusion_range() parses the IVMD of devce id
> >          '4200', the exclusion range of the amd_iommu struct becomes:
> >
> >               iommu->exclusion_start = 0x9F58D000;
> >               iommu->exclusion_length = 0x8040000;
> >
> >       3) When parsing the second IVMD (device id '4300') in
> >          set_device_exclusion_range(), the exclusion range of the
> >          amd_iommu struct becomes:
> >
> >               iommu->exclusion_start = 0x9754D000;
> >               iommu->exclusion_length = 0x8040000;
> >
> >          This overwrites the first IVMD configuration, which leads to
> >          the failure of the first RAID controller.
>
> Okay, I think this is clearly a BIOS bug as the BIOS should not define
> two different exclusion ranges in the IVRS table.

Thanks for the review.

Yes. I understand this is a BIOS bug. The purpose of this patch is to
prevent the failure event though the system boots with the buggy BIOS.

> So there are a couple of options here:
>
>         1) Bail out and disable the IOMMU as the BIOS screwed up
>
>         2) Treat per-device exclusion ranges just as r/w unity-mapped
>            regions.
>
>
> I think option 2) is the best fix here.

Yes. This is what this patch does (The first exclusion region still
uses the exclusion range while the remaining exclusion regions are
modified to be r/w unity-mapped regions when detecting multiple
exclusion regions) .

But, I'm guessing you're talking about that BIOS has to define r/w
unity-mapped regions instead of the per-device exclusions (Fix from
BIOS, not prevent the failure from kernel). Right?

-- Adrian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
