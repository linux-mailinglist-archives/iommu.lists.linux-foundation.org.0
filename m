Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2027BBC4
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 06:06:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5F9685A67;
	Tue, 29 Sep 2020 04:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8UhMmgcvS8i; Tue, 29 Sep 2020 04:06:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2847A8596F;
	Tue, 29 Sep 2020 04:06:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FBC3C016F;
	Tue, 29 Sep 2020 04:06:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45BD8C016F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3437D85C47
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0o_GbU1aisb2 for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 04:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 506FB85C28
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:06:40 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s205so2820312lja.7
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8YsXwgo3KPHwWcfe1EqRif6k6a8lufSqL4k1+GmC9Iw=;
 b=OEr1kq2UweWPHFgI55L5tGm1VUAj9zkJkt+i/OPT+VVHA2UQ1CgP9k9YrXcCA3L0jO
 uTnqUmj7mkEb8FYPmMTSF0Epy/R+kq9D8L1Z4hqVpxkCHU9tcGUWRTothsLwUf/VV0fc
 hX7P6xJX6prz8QTvT0vv6eEIE9B1D/wGfLCTDtiL+PBsOuJ1iLNPhM420SxF1Yl668nF
 4ip8gNOJBYZ3+RrhgY1B1ak4X99rctj3Fh49y/11xd6q7OETNR8swvaK9OKsy3lINd4F
 5c7EBEYI3CFagkY1v1DZG4rcLat7a5POPH48T/Air8R+8ESbwx/2Qx+1FeKqDnYgoju9
 0aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8YsXwgo3KPHwWcfe1EqRif6k6a8lufSqL4k1+GmC9Iw=;
 b=m+BwKa2Pe+IOQ9SUJdW2Q02GqeSaKkClstqZCh7iEzFy+J6IM6HQtqIMcELVgo9ihJ
 OxhMUCPSaM3O1K2uWrXleJge0rdN33ndhCG/aM9EjJpWcRX3I5/kjOdvgMelB2rmozTK
 DUM8c3Bh8f8GNOR65erfVJDTAN0q3T1Ukcktrf9/LGcZa0TeXg3vbP8FVQB6TN7JK2kw
 f77MBMAolyye/cpiU8ZhS0vHNzR4x7NKG8ILk+Pms7ZHj+bSJgM6UMXVOEBDArWCBvvI
 o89fkzc7x4T1ATlgxYL429PHR3cmPIpjEP6FmxnPwBC8vhb+E9XDrIHHQbKPDZr2Xndq
 FEzw==
X-Gm-Message-State: AOAM531ELJKjHLtKvRXAe7kzYhVg7sZwvEGtQUMwtmyEME6zQKSo4Iv5
 ys6dEoLCl9AkrL8ZHhDMJhA=
X-Google-Smtp-Source: ABdhPJyQLKj57i7w5GaEn2Bz+SyKQPTqLHYtcRtXOkRuB6jh/iUfg2yXdzy4Vga6s0sT9Qa8nFo0gQ==
X-Received: by 2002:a05:651c:543:: with SMTP id q3mr490972ljp.6.1601352398288; 
 Mon, 28 Sep 2020 21:06:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id p21sm3081470lfo.194.2020.09.28.21.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 21:06:37 -0700 (PDT)
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <20200928075212.GF2837573@ulmo> <20200928221829.GB15720@Asurada-Nvidia>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a38018a-3f95-74da-6dc1-270efc26a8fb@gmail.com>
Date: Tue, 29 Sep 2020 07:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928221829.GB15720@Asurada-Nvidia>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com
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

...
>> As I mentioned in another reply, I think tegra_smmu_find() should be all
>> you need in this case.
> 
> This function is used by .probe_device() where its dev pointer is
> an SMMU client. IIUC, tegra_smmu_find() needs np pointer of "mc".
> For a PCI device that doesn't have a DT node with iommus property,
> not sure how we can use tegra_smmu_find().

Perhaps you could get np from struct pci_dev.bus?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
