Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7655AF48
	for <lists.iommu@lfdr.de>; Sun, 26 Jun 2022 07:21:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7003845A9;
	Sun, 26 Jun 2022 05:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7003845A9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hBenD693
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zib6gvS1vOF6; Sun, 26 Jun 2022 05:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4899D84574;
	Sun, 26 Jun 2022 05:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4899D84574
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19635C007E;
	Sun, 26 Jun 2022 05:21:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A145C002D
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jun 2022 05:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BCA240182
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jun 2022 05:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BCA240182
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hBenD693
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQVHyJ8I6jYl for <iommu@lists.linux-foundation.org>;
 Sun, 26 Jun 2022 05:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9659400AC
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9659400AC
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jun 2022 05:21:14 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so974952pji.4
 for <iommu@lists.linux-foundation.org>; Sat, 25 Jun 2022 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FyhqfSxVNsjhzX9WxR80RFXqe2zcrAY7cm8JcsXFPog=;
 b=hBenD693M5G/Q6eFcNTFzS4SnqsJJrltg/unkzqdkXjt1KZuJOowmubr8N6pLoDaKD
 fVFiOpC8iAD7EGIlliBp9rs3u8PN97EiT1+qNvS41+MZgPOCJTjoQyeiIIs3aN/S65Mk
 ROLoo90QARopRA/G16LXEfV3XzWV2cbm6BSPsXLWjrONfwr4KFBEPylDD+dVHgwCbYpH
 Nln7DI28nZLcldKdK/hMm8jAMkLlh8JImCgANRilyPgE9ECSv7Kfb/sBQgpFGEXAGxKo
 nt7BB5Uz/MHiajgMyFwmvhtRiUdUohrDkZhxMV7UvAUfaWc1n/g20OMg10VWWb/yD+Eh
 bEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=FyhqfSxVNsjhzX9WxR80RFXqe2zcrAY7cm8JcsXFPog=;
 b=09Sgvsm5fddTs8u7PefvFHCj/yBKQlvtdE08qgqElQN/Z6EE1lHL6hDu610RVl5Gy4
 rNPvvjkEkN/tAaEg7x1Zz8HqfyARUpiksVcQedlu/9aEM0+2scTa5zG0AxGxjF/LAxNr
 1u2I0rK4EE3iePYKtYuRe2VuEBWhBZGgz7JFKC1BqUJ2YFtA0aIEiBlEdzL+w82DmpLF
 fSP0LQYYNh4gsT+Dyta1TyLWNPHDzW9ToSTbfGwq7xvQy5SOzhCeZ1QocncvxXdqUG7Q
 6sR6jQ8AoAXfJWOiVdo4s//WxkmPIi9f6Kj109xeQz/w0/gnfCJhVao6UiwDqRIGLjBm
 a5ug==
X-Gm-Message-State: AJIora+yJqi55sYTPqtvjBWM3J11YtupdhWIWMgnQc2dEa34Vtw/k70P
 ndi89EBi3ain9hRKRooMzIg=
X-Google-Smtp-Source: AGRyM1vu+xqOXfmR3FCthMvvOLmEwQYO6Fqr3qEmZORzf9ji8yNUeLLR6T09iITPOsTmJm0q6+GBiw==
X-Received: by 2002:a17:902:8a91:b0:168:e74b:1056 with SMTP id
 p17-20020a1709028a9100b00168e74b1056mr7540306plo.16.1656220874223; 
 Sat, 25 Jun 2022 22:21:14 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b0016372486febsm4482864plk.297.2022.06.25.22.21.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Jun 2022 22:21:13 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
Date: Sun, 26 Jun 2022 17:21:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Miquel van Smoorenburg <mikevs@xs4all.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>,
 Christoph Hellwig <hch@infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Arnd,

Am 24.06.2022 um 21:10 schrieb Arnd Bergmann:
> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
>>>
>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
>>> have been fixed to use the dma mapping interfaces or have been
>>> removed now.  This means the definitions on most architectures, and the
>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>>>
>>> The only exceptions to this are a few network and scsi drivers for m68k
>>> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
>>> with the old interfaces and are probably not worth changing.
>>
>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
>> virt_to_bus by virt_to_phys in the dma_setup() function there would
>> cause no functional change at all.
>
> Ok, thanks for taking a look here.
>
>> drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it
>> is a PCI-to-VME bridge chipset driver that would be needed on
>> architectures that natively use a PCI bus). I haven't found anything
>> that selects that driver, so not sure it is even still in use??
>
> It's gone now, Greg has already taken my patches for this through
> the staging tree.

One less to worry about, thanks.

>> That would allow you to drop the remaining virt_to_bus define from
>> arch/m68k/include/asm/virtconvert.h.
>>
>> I could submit a patch to convert the Amiga SCSI drivers to use
>> virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.
>
> I don't think using virt_to_phys() is an improvement here, as
> virt_to_bus() was originally meant as a better abstraction to
> replace the use of virt_to_phys() to make drivers portable, before
> it got replaced by the dma-mapping interface in turn.
>
> It looks like the Amiga SCSI drivers have an open-coded version of
> what dma_map_single() does, to do bounce buffering and cache
> management. The ideal solution would be to convert the drivers
> actually use the appropriate dma-mapping interfaces and remove
> this custom code.

I've taken another look at these drivers' dma_setup() functions and they 
all look much more complex than the Amiga ESP drivers (which do use the 
dma-mapping interface for parts of the DMA setup). From my limited 
understanding, the difference between the ESP and WD33C93 drivers is 
that the former are used on 040/060 accelerator boards only (where the 
processor does do bus snooping and DMA can access all of RAM). The 
latter ones would need cache management, could only use non-coherent 
mappings and would require special case handling for DMA-inaccessible 
RAM inside a device-specific dma ops' map_page() function.

That's several bridges too far for me ... I have no Amiga hardware 
whatsoever, and know no one who could test changes to WD33C93 drivers 
for me.

What I have is a NCR5380 with the proverbial 'pathological DMA' 
integration example (and its driver was never changed to even use 
virt_to_bus()!). I might learn enough about using the dma-mapping API on 
that one eventually (though the requirement for at least 1 MB swiotlb 
bounce buffers looks hard to meet), and use that to convert the WD33C93 
drivers, but it would still remain untested.

 > The same could be done for the two vme drivers (scsi/mvme147.c
> and ethernet/82596.c), which do the cache management but
> apparently don't need swiotlb bounce buffering.
>
> Rewriting the drivers to modern APIs is of course non-trivial,
> and if you want a shortcut here, I would suggest introducing
> platform specific helpers similar to isa_virt_to_bus() and call
> them amiga_virt_to_bus() and vme_virt_to_bus, respectively.

I don't think Amiga and m68k VME differ at all in that respect, so might 
just call it m68k_virt_to_bus() for now.

> Putting these into a platform specific header file at least helps
> clarify that both the helper functions and the drivers using them
> are non-portable.

There are no platform specific header files other than asm/amigahw.h and 
asm/mvme147hw.h, currently only holding register address definitions. 
Would it be OK to add m68k_virt_to_bus() in there if it can't remain in 
asm/virtconvert.h, Geert?

>
>> 32bit powerpc is a different matter though.
>
> It's similar, but unrelated. The two apple ethernet drivers
> (bmac and mace) can again either get changed to use the
> dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
> pmac_bus_to_virt() helper.

Hmmm - I see Finn had done the DMA API conversion on macmace.c which 
might give some hints on what to do about mace.c ... no idea about 
bmac.c though. And again, haven't got hardware to test, so custom 
helpers is it, then.

Cheers,

	Michael

> There is also drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c,
> which I think just needs a trivial change, but I'm not sure
> how to do it correctly.
>
>       Arnd
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
