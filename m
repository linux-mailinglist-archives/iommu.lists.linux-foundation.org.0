Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DB251E83
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 19:40:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60DD486E36;
	Tue, 25 Aug 2020 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMLLtFtiLZ4L; Tue, 25 Aug 2020 17:40:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EEA986E3E;
	Tue, 25 Aug 2020 17:40:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3636C0051;
	Tue, 25 Aug 2020 17:40:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8BCFC0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D700F88798
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kDM7AmsoJnV for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 17:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2CE5088788
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 17:40:31 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ds1so1628156pjb.1
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2CIAlEB0sn0czmBCstmmbk0rRRc0a7Q7Eg5uRFK+DTM=;
 b=OWtTyCh4mBkSanD+KT2LmsSmys9GdgNPDuMOUrEMBvirSVEpgWaccxzuVDCSUPzr+g
 UL3d/b/WhkUnWbhm0C+dKAbICczXHeEay6JEghnYPq1AWGXV0OqUHZVzSR0vH40qB4T7
 CvKheJOKe1bLwlHMjKz6V1TnFYQX/QwQ3zFo3OtKNBualjgvS3McIxk5bZckCXdHUxPn
 y5cllopsvswApow32o5Hqk8i69l4DMq5zNUIBV31X/TRx3SDq4RkHJpDQFbpdjwtNLEK
 YafzqTXU3/pyTiKmRDgRCRX9RrujtgeJf8Hbr9VBxTZRL/Jzkqt3LfmQHxV5h/PRKVwB
 vyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CIAlEB0sn0czmBCstmmbk0rRRc0a7Q7Eg5uRFK+DTM=;
 b=g/WfA6UpAASrRsZ3GY4pLD3jvAPwnOpu9gQ0X2d66+qZcL4n62eJp9OaQ7xIMJVEv9
 osrliq2LVFMgDixEKYrIKAXsZAL/atJqIiw3wOYY1x/NmKtl5Kz3tKWMJb7clGiKPYsp
 6UFsdQLcGC+CosOvr0BdDuPNSn/jssYukvYwjsZ6Eg6hgpii4/6sPSiC7OBkSVM8kP5o
 lxZEK4BhV6AaxVIcHgO/jnTVRx8KUWOxnhZR7yYZ6Q5R7YZCZ86A1zuLroWfFzT9/a9t
 OSdGHhoTDtg7Ai+2SYkP0E7zLhwChZBpEu/mPgaGki/KS2dLDvrCXyJR67zuc/8lt+l8
 BGCw==
X-Gm-Message-State: AOAM531jBJj57M9JpZjl3cNV/QxjVYItT+3v1i8pq3WhtNnYuYBc7/92
 3m22m4G+0Ak8qpD0wvd7924=
X-Google-Smtp-Source: ABdhPJygG/iRoMRtYkc62+6+vovnxiIUBYXGvz6sXIt/PP/MjnVCr6wdHgCpE82t+Egu2LRmdgvskQ==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr2403499pjz.151.1598377230639; 
 Tue, 25 Aug 2020 10:40:30 -0700 (PDT)
Received: from [10.69.79.32] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b6sm3378574pjz.33.2020.08.25.10.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 10:40:29 -0700 (PDT)
Subject: Re: [PATCH v11 00/11] PCI: brcmstb: enable PCIe for STB chips
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b19bc982-a0c4-c6ff-d8f5-650f2b3a83c8@gmail.com>
Date: Tue, 25 Aug 2020 10:40:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200824193036.6033-1-james.quinlan@broadcom.com>
Content-Language: en-US
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Rob Herring <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
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

Hi,

On 8/24/2020 12:30 PM, Jim Quinlan wrote:
> 
> Patchset Summary:
>    Enhance a PCIe host controller driver.  Because of its unusual design
>    we are foced to change dev->dma_pfn_offset into a more general role
>    allowing multiple offsets.  See the 'v1' notes below for more info.

We are version 11 and counting, and it is not clear to me whether there 
is any chance of getting these patches reviewed and hopefully merged for 
the 5.10 merge window.

There are a lot of different files being touched, so what would be the 
ideal way of routing those changes towards inclusion?

Thanks!
-- 
Florian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
