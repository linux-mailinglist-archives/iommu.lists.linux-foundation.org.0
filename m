Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C432B50E605
	for <lists.iommu@lfdr.de>; Mon, 25 Apr 2022 18:41:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C15981BB4;
	Mon, 25 Apr 2022 16:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOhN19gPOH42; Mon, 25 Apr 2022 16:41:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8DA3482456;
	Mon, 25 Apr 2022 16:41:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CBECC007C;
	Mon, 25 Apr 2022 16:41:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF739C002D
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 16:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE14382433
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 16:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22jIT5n15MkM for <iommu@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 16:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABA1C81BB4
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 16:41:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e2so15430570wrh.7
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ymNzkfcwSel6W8oV5nbBFFpf/bYmdkm3nOTuaQdreqA=;
 b=ICWq7cr4ucppx5XucKZHwI5K0L+l66C2e5zf8FcME7SWTF8q3l4ieOw0iYBZTw6Kfd
 15KBldbHsftFoe8HtHhKoZHqH7NfgyWzFJk/eOY8YqcMjKCKpc+21puAkQR9bgj/uWH6
 IsZqrY3Eq9uTd41tsfR1xxs47GhlJxQIIj9qNyeYSPqlGf6pbELs/07SuejLtIIeujyB
 MVvFCYgptLOMBEP5u/vxGElDNbHJv851+mT6TjP0LLNRv/nRYNVdfQfEcnyL75xu72FI
 4D/zLtoHu3tq/AtZatkQ1fWMw3bUvAomwyh0AtlA6xBMAyGykTQ85Rp9fo27bP7bjtrg
 8oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ymNzkfcwSel6W8oV5nbBFFpf/bYmdkm3nOTuaQdreqA=;
 b=3+VOMwWiZvcIF2Bbts53R9ZQfOd7ga6Sdwn0or1pTChIdp9TikDz7Piwrz6Rcb212e
 NkYw/9njsZt4+/QabuEVlRMC2wpHSgMUxPwshpOLvGE9BaR1pzQM9zI36AjflYiuJIGp
 4rZHpZkPL4gvfnqPFgp58Ck1i/kerf/SoNQXKvCtAzTrafwlbDdRYQVjaGkTiPtO/bay
 waRkU/JXo2sOKWedHdLPOcA1NXwMlmOMMQIPwrMG5g9VuWlAm8Ar/uvjEddCYNEa2lj9
 M95oBA6le8FUlo1ZGMbNEG5y71rbVwv/4yShb2WNC5/srEPCVL2muuBcR0t/jIQdOf3R
 ypWw==
X-Gm-Message-State: AOAM532bhpXXllYPOAFipgOba6P987tOOcJOY0SGcPO1uVB9zcUCG5gW
 ldczPT9TwOy2EYcXgNLn5I35zg==
X-Google-Smtp-Source: ABdhPJzonWudjlF5ybkAb3XI8W6P1lpxDyOefHSgtMu9zNuZlAC3h+6zbaDQmLFjuGi6AtK+kVhPBg==
X-Received: by 2002:adf:ce89:0:b0:20a:d917:5234 with SMTP id
 r9-20020adfce89000000b0020ad9175234mr6155874wrn.265.1650904858533; 
 Mon, 25 Apr 2022 09:40:58 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm9341132wri.106.2022.04.25.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 09:40:57 -0700 (PDT)
Date: Mon, 25 Apr 2022 17:40:30 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
Message-ID: <YmbO/l5IwfBCHrl8@myrica>
References: <tencent_76E043C4D1B6A21A5253579A61034107EB06@qq.com>
 <tencent_7477100F8A445C6CAFA8F13601A55134480A@qq.com>
 <YmJ/WA6KAQU/xJjA@myrica>
 <tencent_A4E83BA6071B2204B6F5D4E69A50D21C1A09@qq.com>
 <YmLOznyBF0f7COYT@myrica>
 <tencent_2922DAB6F3D5789A1CD3A21A843B4007ED09@qq.com>
 <Yman5hLomw9/c+bi@myrica>
 <76ec6342-0d7c-7c7b-c132-2892e4048fa1@intel.com>
 <YmavoKkVu+hd+x0M@myrica>
 <22b659c7-e972-7a56-2bd7-8df3b4820d4e@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22b659c7-e972-7a56-2bd7-8df3b4820d4e@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, robin.murphy@arm.com,
 Dave Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, zhangfei.gao@linaro.org,
 Thomas Gleixner <tglx@linutronix.de>, will@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Apr 25, 2022 at 08:55:46AM -0700, Dave Hansen wrote:
> On 4/25/22 07:26, Jean-Philippe Brucker wrote:
> >>
> >> How does the IOMMU hardware know that all activity to a given PASID is
> >> finished?  That activity should, today, be independent of an mm or a
> >> fd's lifetime.
> > In the case of uacce, it's tied to the fd lifetime: opening an accelerator
> > queue calls iommu_sva_bind_device(), which sets up the PASID context in
> > the IOMMU. Closing the queue calls iommu_sva_unbind_device() which
> > destroys the PASID context (after the device driver stopped all DMA for
> > this PASID).
> 
> Could this PASID context destruction move from being "fd-based" to
> happening under mm_pasid_drop()?  Logically, it seems like that should
> work because mm_pasid_drop() happens after exit_mmap() where the VMAs
> (which hold references to 'struct file' via vma->vm_file) are torn down.

The problem is that we'd have to request the device driver to stop DMA
before we can destroy the context and free the PASID. We did consider
doing this in the release() MMU notifier, but there were concerns about
blocking mmput() for too long (for example
https://lore.kernel.org/linux-iommu/4d68da96-0ad5-b412-5987-2f7a6aa796c3@amd.com/
though I think there was a more recent discussion). We also need to drain
the PRI and fault queues to get rid of all references to that PASID.

At the moment we disable (but not destroy) the PASID context in release(),
so when the process gets killed pending DMA transactions are silently
ignored. Then the device driver informs us through unbind() that no DMA is
active anymore and we can finish cleaning up, then reuse the PASID.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
