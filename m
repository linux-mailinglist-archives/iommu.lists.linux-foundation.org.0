Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C73DD684
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 15:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5743F404E1;
	Mon,  2 Aug 2021 13:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqk1ru9IcGoK; Mon,  2 Aug 2021 13:09:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2A4A1404DB;
	Mon,  2 Aug 2021 13:09:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC477C000E;
	Mon,  2 Aug 2021 13:09:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D5C1C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 316E2400DB
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wayi7b7fkZxo for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 13:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4B6440004
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:09:09 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so2553739pjr.1
 for <iommu@lists.linux-foundation.org>; Mon, 02 Aug 2021 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s/dUVvpQRfOjAzBt73Z4sPW5uLvROM0ZUBasKGMCJKg=;
 b=kRMvDASIqRBkh8RnkUbf4UEErYFb5pjTrI6eLr74f8VE9FC14kfOqhTTEmBemGcWD3
 vxF/Oj4Z0mk+mgXZi+CkxzbvUrEg28DPozJRYT1LYoOgvdgCBdrLhlOgqpznXe77ZF+D
 ZRsfi1MTLPkKWKWY6a5qMSDRAgZid5FCeeP8fEMwHWa1vSNeigfHF23aRro1H5sDCITB
 EkTFVr45YxpYj6Y6XQuQIcwcDZu7zU/oMfjlkHdXqZuf7OlMlr3TYL3Nw0k3yZuHftYR
 WAG6jG72nxOzN64BlclBwzp9zH42noiu3RiOVNcjdPpHm0wiyHoYEebWFRLTYg8ibXLV
 BBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/dUVvpQRfOjAzBt73Z4sPW5uLvROM0ZUBasKGMCJKg=;
 b=LoAqTA1Cf6ZwzBCzfheDPKb+epSgjF1PSraSbTcDnqWvnBGFfOII0S+pMMSb+PrOY5
 0QszYEU6VoAqqSpIMMayuVoMNIQdio+Bl91Lgu31MfzzqD7P86Cz2jy5HoVp2Stb7GeX
 vNRaB+Vx2iDfaxqC+rK9PRdGtyD1aNM1N9+PMr/GHTfKG16M21iM6Gmg2EnsAA4NROqo
 2DWVRA2sR0p5H226U+fVvV2iOwvYLxWG493RFnCXjXzZk4EXsvaSSIuJnFuv97HJqJ8E
 SDYUVZ6lOxNlzImNYbUiWiwqGEfrUDbleo4bHiEuseZRqu2HsijeFPnscPp6sg4c+7Ph
 11UA==
X-Gm-Message-State: AOAM531B9bdFJZ+O8GtNBPlccNbv+hVH1iYwHuv/GI55vqjT/qTk9UVD
 wlVRpJAHpj7ALN+4/cCkVm0=
X-Google-Smtp-Source: ABdhPJx2NfTYcUiQrmyHhfgUguAE1fsYh8w8C7CJUbW8FCsL7TTUQHMc87bO07ZeIOQ6KIC3nB5Wog==
X-Received: by 2002:a17:902:a415:b029:129:5342:eab7 with SMTP id
 p21-20020a170902a415b02901295342eab7mr2273582plq.26.1627909749426; 
 Mon, 02 Aug 2021 06:09:09 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 g7sm6715970pfv.66.2021.08.02.06.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:09:08 -0700 (PDT)
Subject: Re: [PATCH 04/13] HV: Mark vmbus ring buffer visible to host in
 Isolation VM
To: Joerg Roedel <joro@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-5-ltykernel@gmail.com> <YQfgH04t2SqacnHn@8bytes.org>
 <173823d1-280c-d34e-be2c-157b55bb6bc3@gmail.com>
 <YQfsPv1WC7dnHGDu@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <b1dcf756-d29c-1e64-f630-ae4c53253656@gmail.com>
Date: Mon, 2 Aug 2021 21:08:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfsPv1WC7dnHGDu@8bytes.org>
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, david@redhat.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, vkuznets@redhat.com,
 hpa@zytor.com, anparri@microsoft.com, kys@microsoft.com, will@kernel.org,
 boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, sfr@canb.auug.org.au,
 wei.liu@kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, decui@microsoft.com, hch@lst.de,
 michael.h.kelley@microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, akpm@linux-foundation.org,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@linux.intel.com,
 hannes@cmpxchg.org, ardb@kernel.org, robin.murphy@arm.com, davem@davemloft.net,
 rppt@kernel.org
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

On 8/2/2021 8:59 PM, Joerg Roedel wrote:
> On Mon, Aug 02, 2021 at 08:56:29PM +0800, Tianyu Lan wrote:
>> Both second and third are HV_GPADL_RING type. One is send ring and the
>> other is receive ring. The driver keeps the order to allocate rx and
>> tx buffer. You are right this is not robust and will add a mutex to keep
>> the order.
> 
> Or you introduce fixed indexes for the RX and TX buffers?
>

The interface just allocates a buffer and driver will continue to 
configure the buffer to be rx or tx after calling.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
