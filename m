Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D813A8B1
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 12:52:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0FF78203F0;
	Tue, 14 Jan 2020 11:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EVW4WSwqFxD; Tue, 14 Jan 2020 11:52:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C72F203C7;
	Tue, 14 Jan 2020 11:52:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D205C077D;
	Tue, 14 Jan 2020 11:52:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2449C077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AB96D8693C
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNXv5tN5Y04B for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 11:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 384A281D62
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:52:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so11822314wrj.12
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IzwdNUfwlcqLxXSve6wb9StsyrN71lEbIfR41dllFLE=;
 b=nHwWTsMXEiHgMlLp3rhEKjlY4oFiFN8uVx7EJmL5HpoMLn17G6GskriKC2J4FFqDUf
 D5PQSR5bGBe2KBkkR2zFboV/+9i2TmSPBkL7OTbNdNiHX7nk7ICkuK4+TDYSmsObTwlN
 OiLPLpXLq1/M83nG9MZ4HV3/E8nkRsHlO+3UGguEfdmsc46vGQLVsOn5TDTpRV54ob4n
 pfPb5QzbcX59Yso+X81V+w/rj0PdB4UueRJp1lnyRPXgrA9EDAaNr1NIgCRHQnNRf4Px
 4jf1EDSskOFU/ovVyTUDM3aMNE2/F5yIbTVFheDVn7pktx7l7R1XqxTCuWrnDyXVGPM4
 Ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IzwdNUfwlcqLxXSve6wb9StsyrN71lEbIfR41dllFLE=;
 b=Lp1G8tjkcf51DA/mf4K52DecNnTu8g6dr6J4pG5uzdTqs75agl3dRu/jvpIKmbj1we
 FI9IsWtaDJLVpUlPrLegcqgJhg1p1hMqTlTMapQYqA/bnjvua0poJcKoOvs3JdnJ1Whi
 Qq3SmR85p+JyrvmJeEFyGEDG7KUYy3n3rw4TTCHt9t1XEzSsAl78CRY7S4pNrk89/el9
 3aK+4VqYIqLgUHI+0qppgpKQGtKsZKXGu3eOMszrQ7tytkWSE0pe+Rj7XZPwM31K60aL
 cLB5D101/DMNCMFRw3A0sKmgOeg7E3g02+IL7oBbdtmpasN1vfToVyFsLadGWVOQzfbm
 2cjQ==
X-Gm-Message-State: APjAAAVPBH+3ZDvJuOz48aX5mtdRfSvg7cgqZrrz3piVeXAVD8niBEMF
 DJwYyCH2FS0d6AB7GGUpNBf9vQ==
X-Google-Smtp-Source: APXvYqz9ANL4J4N9FkoeCEsa+reFmsBRsdemTWxAkjYGsn5VOn30+AuMczjNSCVZhAF6FpG81uDvcw==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr24916169wru.220.1579002755460; 
 Tue, 14 Jan 2020 03:52:35 -0800 (PST)
Received: from myrica ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id v22sm18105022wml.11.2020.01.14.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:52:34 -0800 (PST)
Date: Tue, 14 Jan 2020 12:52:30 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 06/13] iommu/arm-smmu-v3: Add context descriptor
 tables allocators
Message-ID: <20200114115230.GA1799@myrica>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
 <20191219163033.2608177-7-jean-philippe@linaro.org>
 <20200114110651.GA29222@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114110651.GA29222@willie-the-truck>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, guohanjun@huawei.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Tue, Jan 14, 2020 at 11:06:52AM +0000, Will Deacon wrote:
> >  /* Context descriptor manipulation functions */
> > +static int arm_smmu_alloc_cd_leaf_table(struct arm_smmu_device *smmu,
> > +					struct arm_smmu_cd_table *table,
> > +					size_t num_entries)
> > +{
> > +	size_t size = num_entries * (CTXDESC_CD_DWORDS << 3);
> > +
> > +	table->ptr = dmam_alloc_coherent(smmu->dev, size, &table->ptr_dma,
> > +					 GFP_KERNEL);
> > +	if (!table->ptr) {
> > +		dev_warn(smmu->dev,
> > +			 "failed to allocate context descriptor table\n");
> > +		return -ENOMEM;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void arm_smmu_free_cd_leaf_table(struct arm_smmu_device *smmu,
> > +					struct arm_smmu_cd_table *table,
> > +					size_t num_entries)
> > +{
> > +	size_t size = num_entries * (CTXDESC_CD_DWORDS << 3);
> > +
> > +	dmam_free_coherent(smmu->dev, size, table->ptr, table->ptr_dma);
> > +}
> 
> I think we'd be better off taking the 'arm_smmu_s1_cfg' as a parameter here
> instead of the table pointer and a num_entries value, since the code above
> implies that we support partial freeing of the context descriptors.
> 
> I can do that as a follow-up patch if you agree. Thoughts?

Do you mean only changing the arguments of arm_smmu_free_cd_leaf_table(),
or arm_smmu_alloc_cd_leaf_table() as well? For free() I agree, for alloc()
I'm not sure it would look better.

For my tests I have a debug patch that allocates PASIDs randomly which
quickly consumes DMA for leaf tables. So I do have to free the leaves
individually when they aren't used, but it will be easy for me to update.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
