Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA7E8D4F
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 17:52:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8044CD73;
	Tue, 29 Oct 2019 16:52:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A9701D4A
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8CBC08CA
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:52:21 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id w12so15510249iol.11
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ELTjDFuXvoYLvu2AvjR9Hiq7mpivxdGzqQtbxhKIKK0=;
	b=EJZg6VR2ZWJkaj7ELud9Yt6Ey9Xv+gAP9f69T34IAj6xmgbQ6JcgCR+4jNO3DZfKWw
	63y8ZqkRA6F9W31jfWtaNXN9InouaqXLoBXcwhL427RDUuHvlf0yQDwSR3V0Kmq5mWqI
	kYeJ/gEa+y4aP+D1aMHSiLBqHIg69q86TVrqt9iMwsH2Zjb/8Ks9nlShpcan/G8nwBLG
	Wtd+za+NNGv099a/nRZF260NGhu/4NWvvJHM6lcU4NC3rXQMNmxVkZZ9LxcEm13DPDbm
	ngvLCv/18P5RVRtBXk6VfFEs2bCHVPlDoNbFORu5pk3YtICAeaXxYnjSKZyF7JLcmQcj
	/g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ELTjDFuXvoYLvu2AvjR9Hiq7mpivxdGzqQtbxhKIKK0=;
	b=oOUsK88lI+FyGb8X0RYfGtg5DEOkB77zCM77nO7aLMXWSCWpyME1EYobiA8hngL9W6
	9CzJJYOxiuFqYlE7CiK44gVeDGMhHCYa21MJIyqWL3Q5g/yu/Ey2ebfDsUR3rKwOcBAY
	UPmWfBcnGAfDnoN9dxlh4KNKl3d9/HqdsT+gdA9wkmtLnDjjDjH9yovH/TY76VNOrO7j
	M7/lN2jMZIV29Lr7TFZwFDXUvSJ7dLatuZxB0qsnDB7RAKArnBgzk/VWDTnv9VDKNCHD
	sDSqGkLREv8s1WGj9v+6kyc1Ntm0ijYx6klx8Atn8LU0XH1q7FavlLzRHL2NUrH/zis6
	hQmg==
X-Gm-Message-State: APjAAAUlHNuWZek3GA6Orz6ExSBk+Iqdu8YJh0T/JOoGwSL25Kk+5U91
	TOKEl5ihTu0XyfU76KENWh7HTCHl4PuHadVCQas=
X-Google-Smtp-Source: APXvYqxd+WcVlTVe5peKMNakg+JlU3pPhrhR57ajZeSb6xWZunErGgHKDSNAvJ0NqhKA0fGUQEY8AJnpPGdyjS0wZj4=
X-Received: by 2002:a6b:f00c:: with SMTP id w12mr4725179ioc.207.1572367940691; 
	Tue, 29 Oct 2019 09:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
	<d983cf57-f13d-a680-21c4-09b5ca93bc64@arm.com>
	<acf0dd2c-7e12-fba6-b7f8-dfd78c892fe5@arm.com>
	<417fa080-08f9-9f35-687b-c0b82a61628d@arm.com>
	<376133e3-25f2-ffe7-ef9f-4613388b2bf7@arm.com>
	<84747008-85e9-e71a-b9ad-cefcc6c0f661@st.com>
	<3305c91e-e630-b7fd-4c6f-598583504d67@arm.com>
	<6b024e69-f612-6850-8a04-9b3049549092@st.com>
	<2153b504-8c98-6c43-6ae3-9fb355d88417@arm.com>
	<CAA2QUqJcJuhnAEOirNYdM4W_+sskO=CvLB9R7PpCPg-hsBLBJQ@mail.gmail.com>
In-Reply-To: <CAA2QUqJcJuhnAEOirNYdM4W_+sskO=CvLB9R7PpCPg-hsBLBJQ@mail.gmail.com>
From: Daniele Alessandrelli <daniele.alessandrelli@gmail.com>
Date: Tue, 29 Oct 2019 16:52:08 +0000
Message-ID: <CAA2QUqJcZeaBhAzcmxK7=TvU9MyYosG3ZdfiTsdntzVm5=6+Jg@mail.gmail.com>
Subject: Re: [BUG] dma-ranges, reserved memory regions, dma_alloc_coherent:
	possible bug?
To: Vladimir Murzin <vladimir.murzin@arm.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Tue, Oct 29, 2019 at 9:43 AM Daniele Alessandrelli
<daniele.alessandrelli@gmail.com> wrote:
>
> On Mon, Oct 28, 2019 at 10:59 AM Vladimir Murzin
> <vladimir.murzin@arm.com> wrote:
> >
> > @Daniele, it'd be handy to know if that fix issue for you...
> >
>
> Apologies, I've been traveling for the last few days and haven't
> managed to try it yet.
>
> I'll do it later today though and let you know.

Hi Vladimir,

I can confirm that your patch fixes the issue I was having. Thanks!

Regards,
Daniele
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
