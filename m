Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C736D360422
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 10:20:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41E704012B;
	Thu, 15 Apr 2021 08:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3aSyq97uFUi; Thu, 15 Apr 2021 08:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6091E4012C;
	Thu, 15 Apr 2021 08:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36229C000A;
	Thu, 15 Apr 2021 08:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A48CC000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47B1B40F9C
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3cNZWtaHIxT for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B3F240F90
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:19:56 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id a12so15549459pfc.7
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55qzNVVtKjr2EGfMAcgdM/oHJ/MI5Oe+cwdS/Ji0ZVI=;
 b=j1tVlhHWeqCzmIWXEopfN2gvVhO87Jr/RyNB0t/arTH8+bg7DKBr+fI040TTp9S9dB
 /NzzFMy3hbY/ewwcaITstDzoy52Wgs4wGuQ5U5o4uPJowRFrrEnSMnP8N2Qb3i5zZjXQ
 sCqSMpYbitygg49aIHDhasd3Pi72eqGwhTPoAnW1qgSzqZW7XWXrv/4JCx9LSDXMvhzf
 znL5/rmGU9y1+OFti8QmL1ryMuD9so/V9sqtlzAaVReyqpoDpbqtdZOG7VIAMj0ZL4w4
 Kv0HXVb9dekpbqJdlNhLG+oY2Owt4l/wcViRbNFuH7o1uikboz9/tlwvLhkf0FLxKmmz
 xTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55qzNVVtKjr2EGfMAcgdM/oHJ/MI5Oe+cwdS/Ji0ZVI=;
 b=WRR/pDDdLWjYaPgXx5IZOx2Z30nFO5Cvq8SW1n94tB0EHQBcis9TcF8rsGTYkUJFDR
 teM96GIntB/pb+GNXsjx7+RZH1rdk7D9PfRYbU3WQoen5ogFoJLOTLlZOSSmhHb90CpQ
 LngG2RhSlDW5155vJF4WhDlsd7Y77IxsIJ8QEYoix+50gzsCkg/wvPzxV2sJxOM0GbQU
 VeKTmERyusTRvjnzjzdzJFu3poBeTC646IFhffnTQZVOdCqsM8A270w9lLhmVgFUFBzd
 ZuWbOuHRHy6luxz2REcHkoJOYYca5EqznisNP4lKDDLYfaRKuU7ElRD8KLWN32tmC8nK
 N2ug==
X-Gm-Message-State: AOAM531TdHYMBkRC1s2sXhcmEm8HX3IBzqAbgcRsc/Pr6ao8YW9lwwBr
 njNNtfH+tRyGPn7s1Ndnm6g=
X-Google-Smtp-Source: ABdhPJwWGtaQnufAXInm7v66wKabfVJG17NJUFp65axa03YX5DYY821+MSztj4RCKZDgwDB8o2T9wQ==
X-Received: by 2002:a63:470f:: with SMTP id u15mr2378163pga.199.1618474795726; 
 Thu, 15 Apr 2021 01:19:55 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:6:8000::a31c? ([2404:f801:9000:1a:efeb::a31c])
 by smtp.gmail.com with ESMTPSA id h21sm1732615pgi.60.2021.04.15.01.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:19:55 -0700 (PDT)
Subject: Re: [Resend RFC PATCH V2 04/12] HV: Add Write/Read MSR registers via
 ghcb
To: Christoph Hellwig <hch@lst.de>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-5-ltykernel@gmail.com>
 <20210414154141.GB32045@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <d35e6ab5-cb25-61aa-e36e-7e4bcb241964@gmail.com>
Date: Thu, 15 Apr 2021 16:19:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414154141.GB32045@lst.de>
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, sunilmut@microsoft.com,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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

On 4/14/2021 11:41 PM, Christoph Hellwig wrote:
>> +EXPORT_SYMBOL_GPL(hv_ghcb_msr_write);
> 
> Just curious, who is going to use all these exports?  These seems like
> extremely low-level functionality.  Isn't there a way to build a more
> useful higher level API?
>

Yes, will remove it.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
