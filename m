Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 41260345C48
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 11:53:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD776837AC;
	Tue, 23 Mar 2021 10:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBeV5dte9zst; Tue, 23 Mar 2021 10:53:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F47830E2;
	Tue, 23 Mar 2021 10:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8826BC0012;
	Tue, 23 Mar 2021 10:53:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09A59C0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 10:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B1C6081A
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 10:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoarBOkdC-V1 for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 10:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 036796068A
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 10:53:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j7so20291337wrd.1
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 03:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WGlnCIX+gPkt5saLRl1AO/eSfyQX4KhnrSrkJYnpgYY=;
 b=lIV8cb4KFfS7wkzFGd10vbdRrumERBd84XwjQG3DjbGuRdwbmikbg0jk61DgpoawxN
 BBl7QlKsTaJXnPCOF2y6MKlpThqG96Zmz81Yrp+FEZ6nTCt8av7uCsN5iwc29SpdsQSl
 EiW8j9VDV469niDRLYcAmzwI0D62kxpgUkue6nlgB7GxWnCpKMJp7zKfYmw4LCttdy0W
 G+gypPOTuKhWasizmui5cLDWk8ApZ/QXiji5JiDhmE2Nqmn2He3ID9hBKFsjODY4B8Q9
 b/M0eeC82xya4hZASNOjs2fKQtd+/3nIbS+1xCePGaJtlOEzWWikRqqdme5aVwM8jGf1
 rxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WGlnCIX+gPkt5saLRl1AO/eSfyQX4KhnrSrkJYnpgYY=;
 b=kbTWEKUc50RvlzS8MzQDatrsA9agFM9qQD6ID6mgMRsO6y0vq7aslfcUhygdWdmKwS
 nGzNTiachiAFKvVXaroYSXWNjsD5SVw5I5YDesR22E3+SPioxb0jcn4sfi3GtNrcs2rt
 /z1rq4fWHIczy5IHurJKSV1XCUDIMnkafyx05b8kN5LhJdFdZIV+HbXod3fTyAbPYsD4
 p1NwxoNH5+KYDFR1RGVdv1RBZ5Qj1+oei+Cr7sg0N/xc+MdUEAXRskqm1smCFpMKtVFo
 60T6PLpXv5b3qqy+mFp2yjKZKODTCFE5MLNsmeDaPY3Q4IKfDnhEONtt2H8nKsuE+TKF
 fjDw==
X-Gm-Message-State: AOAM533U115oenlNG+/shjMu6nvlkk4A/v4hI0/ztgK53L/5Ij2pnS6v
 deCVeyWSG71cI6wyFkT5cT9j/w==
X-Google-Smtp-Source: ABdhPJxsZ4rfGrv8Gu+78757z6bQt9fLbU/W53+clBFuohI6UOhnceZv0BUdjXF3LdKpnrW2LNNtVA==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr3253375wrt.133.1616496808336; 
 Tue, 23 Mar 2021 03:53:28 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id z1sm23063818wru.95.2021.03.23.03.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:53:27 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:53:10 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH v13 06/10] iommu: Add a page fault handler
Message-ID: <YFnIlrecY6nkq5pP@myrica>
References: <20210302092644.2553014-1-jean-philippe@linaro.org>
 <20210302092644.2553014-7-jean-philippe@linaro.org>
 <20210303055727.GF1914@otc-nc-03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303055727.GF1914@otc-nc-03>
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, will@kernel.org,
 linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org, lenb@kernel.org,
 devicetree@vger.kernel.org, kevin.tian@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
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

On Tue, Mar 02, 2021 at 09:57:27PM -0800, Raj, Ashok wrote:
> > +	ret = handle_mm_fault(vma, prm->addr, fault_flags, NULL);
> 
> Should we add a trace similar to trace_page_fault_user() or kernel in
> arch/x86/kernel/mm/fault.c 

Yes that would definitely be useful for debugging hardware and developping
applications. I can send a separate patch to add tracepoints here and in
the lower-level device fault path.

> or maybe add a perf_sw_event() for device faults? 

It does seem like that would fit well alongside the existing
PERF_COUNT_SW_PAGE_FAULTS, but I don't think it would be useful in
practice, because we can't provide a context for the event. Since we're
handling these faults remotely, the only way for a user to get IOPF events
is to enable them on all CPUs and all tasks. Tracepoints can have 'pasid'
and 'device' fields to identify an event, but the perf_sw_event wouldn't
have any useful metadata apart from the faulting address.

We could also add tracepoints on bind(), so users can get the PASID
obtained with the PID they care about and filter fault events based on
that.

I've been wondering about associating a PASID with a PID internally,
because we don't currently have anywhere to send SEGV signals for
unhandled page faults. But I think it would be best to notify the device
driver on unhandled fault and let them deal with it. They'll probably want
that information anyway.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
