Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8313461B3D
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 16:43:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B5D827BA;
	Mon, 29 Nov 2021 15:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxS5-GwqG4Al; Mon, 29 Nov 2021 15:43:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 565C0825CA;
	Mon, 29 Nov 2021 15:43:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24519C000A;
	Mon, 29 Nov 2021 15:43:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23A45C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BC1060A83
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zj_FpRAu38jj for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 15:43:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 548C660A72
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:43:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so37782211wrb.2
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c1tPtK4234RzEJWdk1WuLUNOshhLfQVugRr+E/JBV7g=;
 b=g2iBnLzqE+SGysyAa+bTZmQuY2vqxlkuegiDpA1TflrERCuQyPkBS/gcIY+OW8xC97
 aI8V/5mGz8nis/fl1rwHHXcq5+7Cj8DnrqKVyXHv+5X6f4nqiOOmYctZLU9wEIVh9jI9
 y339j2x5j+cp3EvWpj1Xegqk2EYEWeeWw2b/R2u7GkJdrMetyUq+/DqvfgOtGSVHTEnQ
 064lBcZ4X3h+G4+/lHPwG4biBSxXcuEWwKDzKjia2MbY04zt8+0sfr0XoQAMNyyYNI+G
 Et7XRWkzVbCYJt3ICPCTvZcbmuZkJ7KdWqun7A3PEECN8TJ4pPejUMPBXxqT03KH+Wd3
 tJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1tPtK4234RzEJWdk1WuLUNOshhLfQVugRr+E/JBV7g=;
 b=1DNorTsPESFLIXoMLa+929Eh8FPvGopj4MfB6z5UpUmHLooQQYmUU9Y2UOFi/4a0qm
 /Shah1180VVQnsyyBbctxH1dMtgB3+B5E7gkTYicDs6L/i9LBDWsLE1/lS35jPweQrFH
 khcuM/YxFrCep7JzEUfXv+drrxKkynfjLHd+9M3fQK/MWJigWsW6/AsXvOJxzLR2ucmS
 brqB6+NW3AxbagdYZqbOoz5tHpi/Xv/BGJCd+qB8cNxGTTn6KT2AN8m0xuFmpEmp1u/a
 NOfZ78cB8xLOeTjxGSwTK3sb/jXlSOdnHksyMX2vTPGmV/17u6jntGawQtdqh/WdDoKs
 PqNA==
X-Gm-Message-State: AOAM533HJuGfMGhXwJ9TE0MG5uXstb7Dbzk+MlUqFUMpZDO4eR0hrKcg
 Z10z+ZU9Ii/NIyAy3M7ZzIT/Yg==
X-Google-Smtp-Source: ABdhPJwKBmo1MmuxbifKQZpvxvwmsEEyZ57GieBhblMgmCSXKl2ODJEBwBMGXXvNmg5uMFFU0yAMbw==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr33970909wri.326.1638200599356; 
 Mon, 29 Nov 2021 07:43:19 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id p5sm14473848wrd.13.2021.11.29.07.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 07:43:18 -0800 (PST)
Date: Mon, 29 Nov 2021 15:42:56 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] iommu/virtio: Pass end address to
 viommu_add_mapping()
Message-ID: <YaT1ACdwq1n4YBug@myrica>
References: <20211123155301.1047943-1-jean-philippe@linaro.org>
 <20211123155301.1047943-5-jean-philippe@linaro.org>
 <7b79fe9b-9d51-8bda-2868-b48781f07fc9@redhat.com>
 <20211127180742-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211127180742-mutt-send-email-mst@kernel.org>
Cc: kevin.tian@intel.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com, will@kernel.org,
 jasowang@redhat.com
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

On Sat, Nov 27, 2021 at 06:09:56PM -0500, Michael S. Tsirkin wrote:
> > > -static int viommu_add_mapping(struct viommu_domain *vdomain, unsigned long iova,
> > > -			      phys_addr_t paddr, size_t size, u32 flags)
> > > +static int viommu_add_mapping(struct viommu_domain *vdomain, u64 iova, u64 end,
> > > +			      phys_addr_t paddr, u32 flags)
> > >  {
> > >  	unsigned long irqflags;
> > >  	struct viommu_mapping *mapping;
> 
> I am worried that API changes like that will cause subtle
> bugs since types of arguments change but not their
> number. If we forgot to update some callers it will all be messed up.
> 
> How about passing struct Range instead?

I gave struct range a try but it looks messier overall since it would only
be used to pass arguments. I think the update is safe enough because there
is one caller for viommu_add_mapping() and two for viommu_del_mappings(),
at the moment.

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
