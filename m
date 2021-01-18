Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DF2F9C2E
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 11:08:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61592842F6;
	Mon, 18 Jan 2021 10:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5Xo-21-CetM; Mon, 18 Jan 2021 10:08:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A9AF84031;
	Mon, 18 Jan 2021 10:08:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7304AC013A;
	Mon, 18 Jan 2021 10:08:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8521C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 10:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD506857C5
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 10:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkZkOtH4ArWb for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 10:08:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2729485546
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 10:08:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a10so6225670ejg.10
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 02:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qECQt3l5OEEcYku7TfMYOUTWED64ArCIIVRgQSduy+E=;
 b=uWev3XS0PCKEpZ1iTWw0EVv6pDwiRAfP+5/Ac6+DuxygGfGjiIzWLxneVSCQYfj6NF
 i+NknxUxkB7zCUZhGmzlkU8Yjfa0alZ990pFQ3Un1d8Cq654kwiprnwTaI6G/mvUQubK
 uCRNPMMAJYhKmUdRAvBR6xKSNkmPLuU9+h5IQTlvb+zMoA6b+Q+o2imcUqYrjoJI/UIw
 EVqVMX1OME+WsCxppmcz00+8F7yrtV+4uggI+uVZOUjJNFf4m0fBqQSLfiEDqDO44M87
 DxLNZB8DmxIXqpF7sRsVrpJHuPVAk/7v6zqfq50uydLxJNMx4Sh801qS63Za2Zwp9XYZ
 Gdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qECQt3l5OEEcYku7TfMYOUTWED64ArCIIVRgQSduy+E=;
 b=kZUEIjdJvryRRcBU4h5XgoxAU1om78tfcsn1aRf4W+j4VJhFHzPJVg9edAZC/nNarR
 TGOPb9YBmeqSwTh+BluvTu+CRTs50H52u7Rlgwe2ciSaPNjln4P6uCpx9OvfzbV1uBhm
 25rAN3jy3H5xqCeQQ016lfqB0Gwd9I7ev8cBNCHzewd8rv1SKhg1EksopUP/wdy3daNO
 b0gokN2OXYA8WCndLhETdymejwEZ0O9uVkgtCsr10b30mn+xsCzfhwsIzbjCjc3uWIfT
 4G3VdWYq2i6q0UlMP3X78gVPpK1O3pJLojcO3HR/0Wez36cPfS+Kl9UBPEiXcZKfTO+e
 52jA==
X-Gm-Message-State: AOAM530+7H9hsp2ERT5gg8RLjY65FGJl3DsdStBT2QoYHNY3rNpzc9rb
 TF2PY9lzc9Fr9ClY/ygSLbBQNQ==
X-Google-Smtp-Source: ABdhPJyrwgYBnhQeuMb/RbRNmMxBdCmN47Y+UKBhEZP1a8ITTItX36PvKPTFgMWzCbD4CXwCVeBZjA==
X-Received: by 2002:a17:906:2694:: with SMTP id
 t20mr12118442ejc.48.1610964516484; 
 Mon, 18 Jan 2021 02:08:36 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id r23sm9190014ejd.56.2021.01.18.02.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 02:08:35 -0800 (PST)
Date: Mon, 18 Jan 2021 11:08:12 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v4 2/3] iommu/iova: Avoid double-negatives in magazine
 helpers
Message-ID: <YAVeDOiKBEKZ2Tdq@myrica>
References: <1607538189-237944-1-git-send-email-john.garry@huawei.com>
 <1607538189-237944-3-git-send-email-john.garry@huawei.com>
 <YAHRKCkcHAEUdRNT@larix.localdomain>
 <69c30e85-4a72-a0e1-1e56-4ffbd0df5aba@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69c30e85-4a72-a0e1-1e56-4ffbd0df5aba@huawei.com>
Cc: will@kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On Mon, Jan 18, 2021 at 09:24:17AM +0000, John Garry wrote:
> On 15/01/2021 17:30, Jean-Philippe Brucker wrote:
> > On Thu, Dec 10, 2020 at 02:23:08AM +0800, John Garry wrote:
> > > A similar crash to the following could be observed if initial CPU rcache
> > > magazine allocations fail in init_iova_rcaches():
> > 
> 
> thanks for having a look
> 
> > Any idea why that's happening?  This fix seems ok but if we're expecting
> > allocation failures for the loaded magazine then we could easily get it
> > for cpu_rcaches too, and get a similar abort at runtime.
> 
> It's not specifically that we expect them (allocation failures for the
> loaded magazine), rather we should make safe against it.
> 
> So could you be more specific in your concern for the cpu_rcache failure?
> cpu_rcache magazine assignment comes from this logic.

If this fails:

drivers/iommu/iova.c:847: rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());

then we'll get an Oops in __iova_rcache_get(). So if we're making the
module safer against magazine allocation failure, shouldn't we also
protect against cpu_rcaches allocation failure?

Thanks,
Jean

> 
> Anyway, logic like "if not full" or "if not empty" is poor as the outcome
> for NULL is ambiguous (maybe there's a better word) and the code is not safe
> against it, and so I replace with "if space" or "if have an IOVA",
> respectively.
> 
> Thanks,
> John
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
