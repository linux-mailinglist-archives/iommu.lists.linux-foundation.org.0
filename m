Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD0260482
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 20:29:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD977860B5;
	Mon,  7 Sep 2020 18:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86+TEJv8HFq1; Mon,  7 Sep 2020 18:29:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D808863D5;
	Mon,  7 Sep 2020 18:29:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32C94C0051;
	Mon,  7 Sep 2020 18:29:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37BC2C0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 336848608B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OaMESgrt-cd for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 18:29:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 82AE784D89
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:29:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w186so8353071pgb.8
 for <iommu@lists.linux-foundation.org>; Mon, 07 Sep 2020 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bmURCbMiaqKzzelpk/S2JynuuyDAIuukHKp0frES45k=;
 b=pGJxdnPlnnjuVnEQiNNF8NPZ9N8cHRKSXuzhjcwyPpc1EErwzM0CyOU4oIwN4LS9Mw
 1wC7EvuKj0Ax1z41J2Q3+FCDPwoQdUe7gPwjEhSmttF1uE8TKkr0ZeZZaCOYAlsTrSqs
 1hDtsmCA12I0M7LfTaBMaahkp6lybABgSUqZ0T/SfYV2TIViz4H4Kf4gHzZu64C2mrWY
 hdu86ghnR/J8FGXfGJpJFZ+boynxUUhjN2XGe9NwROXh85rZPnj3p6DBsKU/2NHGtf8x
 ChhltHIi6E47BdFQF4Mbz+1aEHdsFzD7p965i8s22ViF4mXU7St3Cx+aCA3tXWJyqQQm
 g1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmURCbMiaqKzzelpk/S2JynuuyDAIuukHKp0frES45k=;
 b=o5SDA/GbAtCJQegpCGPh7eVnm5ACJX1ev1Dr0oAjgOMJRl3qhTJhpTdyGntz+hcakw
 jssqwhL0NIpb4CcF/wVNfn1tzroGouqzgoMIH2/Z5P1QaHdnise79yqS6V8VM3zGzdPo
 MvI4eRAMh6eG57ptJ7+gqX4M2w5tiyaD3Dv8n4LmPgQPVbbB10eIDIMVf2ACKB9Utzj/
 QDvUxoD3g+RTOKjSqAMwXgDph1UFSA/BQUk2On53D9UIAuHUzbePtOSw/iZVI5D10Mr8
 1CFc1VGvqEsd1QFZB9NGjCbRzd152aXfNFSI206c/mQnPfqiwYQrKUxJC/5om8N/uYc5
 QBLA==
X-Gm-Message-State: AOAM533xmCnCKmbG33769RCL/wGos3MwXzwWGqp8R9heMLnzm5+anE7t
 92eAQ0/ZWsVvyNpjuBCCh0g=
X-Google-Smtp-Source: ABdhPJyh6g2rRcD6ogNPy2tapg1StlUEf/BdvWQy8jzaR475oJoKQT/NWFiUoNd1k6PiwSYe5VKk+A==
X-Received: by 2002:a62:fb05:: with SMTP id x5mr21991954pfm.121.1599503349977; 
 Mon, 07 Sep 2020 11:29:09 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 13sm15823860pfp.3.2020.09.07.11.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 11:29:09 -0700 (PDT)
Subject: Re: [PATCH v11 00/11] PCI: brcmstb: enable PCIe for STB chips
To: Jim Quinlan <james.quinlan@broadcom.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <b19bc982-a0c4-c6ff-d8f5-650f2b3a83c8@gmail.com>
 <20200827063517.GA4637@lst.de>
 <CA+-6iNy3U9pO0Bykzgvb9n9fcsBi6FiatLdpA1s0HgQNWZ49mg@mail.gmail.com>
 <20200907091649.GA6428@e121166-lin.cambridge.arm.com>
 <CA+-6iNzoz3pM2pJksXogeuou6wB9W-59rN-amCLERFLuY5zLMg@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <00e49acb-c659-de10-3e87-76bfd82e4a76@gmail.com>
Date: Mon, 7 Sep 2020 11:29:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <CA+-6iNzoz3pM2pJksXogeuou6wB9W-59rN-amCLERFLuY5zLMg@mail.gmail.com>
Content-Language: en-US
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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



On 9/7/2020 10:43 AM, Jim Quinlan wrote:
> On Mon, Sep 7, 2020 at 5:16 AM Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
>>
>> On Thu, Aug 27, 2020 at 09:29:59AM -0400, Jim Quinlan wrote:
>>> On Thu, Aug 27, 2020 at 2:35 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> On Tue, Aug 25, 2020 at 10:40:27AM -0700, Florian Fainelli wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/24/2020 12:30 PM, Jim Quinlan wrote:
>>>>>>
>>>>>> Patchset Summary:
>>>>>>     Enhance a PCIe host controller driver.  Because of its unusual design
>>>>>>     we are foced to change dev->dma_pfn_offset into a more general role
>>>>>>     allowing multiple offsets.  See the 'v1' notes below for more info.
>>>>>
>>>>> We are version 11 and counting, and it is not clear to me whether there is
>>>>> any chance of getting these patches reviewed and hopefully merged for the
>>>>> 5.10 merge window.
>>>>>
>>>>> There are a lot of different files being touched, so what would be the
>>>>> ideal way of routing those changes towards inclusion?
>>>>
>>>> FYI, I offered to take the dma-mapping bits through the dma-mapping tree.
>>>> I have a bit of a backlog, but plan to review and if Jim is ok with that
>>>> apply the current version.
>>> Sounds good to me.
>>
>> Hi Jim,
>>
>> is the dependency now solved ? Should we review/take this series as
>> is for v5.10 through the PCI tree ?
> Hello Lorenzo,
> 
> We are still working out a regression with the DMA offset commit on
> the RaspberryPi.  Nicolas has found the root cause and we are now
> devising a solution.

Maybe we can parallelize the PCIe driver review while the DMA changes 
are being worked on in Christoph's branch. Lorenzo, are you fine with 
the PCIe changes proper?
-- 
Florian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
