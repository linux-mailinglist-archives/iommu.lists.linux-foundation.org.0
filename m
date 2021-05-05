Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFCB37346D
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 06:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90926846AA;
	Wed,  5 May 2021 04:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv2I7O4Au6LU; Wed,  5 May 2021 04:29:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95373846A8;
	Wed,  5 May 2021 04:29:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AFF2C0001;
	Wed,  5 May 2021 04:29:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9F9EC0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 04:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 903DC60637
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 04:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs-ru.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siww64GgxTLY for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 04:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F3E460630
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 04:29:05 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id x188so1118951pfd.7
 for <iommu@lists.linux-foundation.org>; Tue, 04 May 2021 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkfLmEwUYBpgZ3VRNqk3l0eUK71c8qK9M3LO8M6K/A4=;
 b=j/2/x3IGENqBt1eM/uTRys9FwUAyOd7d1CPrhgnUeDqkdWgk208eetcKGgAwQm0ClS
 807Quye1hCoirriQHZ8jB6fGbUq8JRjgdvApCO7Sk2LBzgsemv98xXqPqhRBtNTYFbQ2
 c+pvRacMoE5zUBhZlKz1Zp/I3sP37UVPa/SyFRnF0O9Vv0+UUbY2fjviPRN77nwLubJm
 WkGzNUwF7P0ucQPk4Bw8kKF/DF8Lt/l4gAxFgApBd4DtEkMPmr//4N1veXHtU6pvce11
 I2Ygs6SMbnq3+EW7szo7yKB9Z6UagEOZuXHkUZLToFvlJwesJGEXi2KI7w4v+L0cFgNN
 jqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkfLmEwUYBpgZ3VRNqk3l0eUK71c8qK9M3LO8M6K/A4=;
 b=UEuKa7G3AqxIMRNjJ4o09l2Mzsg1uIxWymk4MKSZK1GX2+BSWh38BLHL6ZPj+JJJAK
 +eYzFEVXtVVAGcqDVqceoi9fcpZjMAlb0zp4ZLj3FW9PeklI4KYCoeZuaxtXoc92/hXW
 UQNRujuU95mnFDtgT8Yk4k3+5nykinA03zc1+cwV4l0tCznwP4ghzyjYqrEOFOj97Bcr
 B2bE+VULfOqj6McS8xWdasNa1Zph1KqKB7IDbd+tL6V6hXL2gO1xEhHbHeuD9uSv00xa
 JS0NPeAAITN89Dt1vuBfqOn6yDGGrxJ1EYRm9+gSlrZtleXWi51rCyEbgdEV9nM0rxNF
 YdSg==
X-Gm-Message-State: AOAM5324fvZR+VLkCLeOEsKwY7R37kIpLNKZMhWIjSPMcR05bdQgxDl3
 Lo2+PtBCZZpZLx4imhR+hLfEzw==
X-Google-Smtp-Source: ABdhPJwj5l+dKlySIdCGZk4hFYyrFl+frI0ecQuTkJrGFGr2OgKeAZLnUNmYF3pUR0T+bfW0S+MHsg==
X-Received: by 2002:aa7:8051:0:b029:272:7b9c:cde1 with SMTP id
 y17-20020aa780510000b02902727b9ccde1mr26211062pfm.55.1620188944813; 
 Tue, 04 May 2021 21:29:04 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id l6sm5170914pgc.68.2021.05.04.21.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 21:29:04 -0700 (PDT)
Message-ID: <7e5c2276-ca1c-a8af-c15f-72a7c83c8bfa@ozlabs.ru>
Date: Wed, 5 May 2021 14:28:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and allocation
 APIs
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210421133312.15307c44@redhat.com>
 <20210421230301.GP1370958@nvidia.com> <20210422111337.6ac3624d@redhat.com>
 <YIeYJZOdgMN/orl0@yekko.fritz.box> <20210427172432.GE1370958@nvidia.com>
 <YIi5G4Wg/hpFqNdX@yekko.fritz.box> <20210429002149.GZ1370958@nvidia.com>
 <YIol9p3z8BTWFRh8@yekko> <20210503160530.GL1370958@nvidia.com>
 <YJDFj+sAv41JRIo4@yekko> <20210504181537.GC1370958@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210504181537.GC1370958@nvidia.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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



On 05/05/2021 04:15, Jason Gunthorpe wrote:
> On Tue, May 04, 2021 at 01:54:55PM +1000, David Gibson wrote:
>> On Mon, May 03, 2021 at 01:05:30PM -0300, Jason Gunthorpe wrote:
>>> On Thu, Apr 29, 2021 at 01:20:22PM +1000, David Gibson wrote:
>>>>> There is a certain appeal to having some
>>>>> 'PPC_TCE_CREATE_SPECIAL_IOASID' entry point that has a wack of extra
>>>>> information like windows that can be optionally called by the viommu
>>>>> driver and it remains well defined and described.
>>>>
>>>> Windows really aren't ppc specific.  They're absolutely there on x86
>>>> and everything else as well - it's just that people are used to having
>>>> a window at 0..<something largish> that you can often get away with
>>>> treating it sloppily.
>>>
>>> My point is this detailed control seems to go on to more than just
>>> windows. As you say the vIOMMU is emulating specific HW that needs to
>>> have kernel interfaces to match it exactly.
>>
>> It's really not that bad.  The case of emulating the PAPR vIOMMU on
>> something else is relatively easy, because all updates to the IO page
>> tables go through hypercalls.  So, as long as the backend IOMMU can
>> map all the IOVAs that the guest IOMMU can, then qemu's implementation
>> of those hypercalls just needs to put an equivalent mapping in the
>> backend, which it can do with a generic VFIO_DMA_MAP.
> 
> So you also want the PAPR vIOMMU driver to run on, say, an ARM IOMMU?


This is a good feature in general when let's say there is a linux 
supported device which has a proprietary device firmware update tool 
which only exists as an x86 binary and your hardware is not x86 - 
running qemu + vfio in full emulation would provide a way to run the 
tool to update a physical device.


-- 
Alexey
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
