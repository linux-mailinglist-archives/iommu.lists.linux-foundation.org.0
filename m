Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EA50E313
	for <lists.iommu@lfdr.de>; Mon, 25 Apr 2022 16:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5287E81C2F;
	Mon, 25 Apr 2022 14:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJS8gM5HYDXW; Mon, 25 Apr 2022 14:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74FDA81970;
	Mon, 25 Apr 2022 14:27:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 516F0C002D;
	Mon, 25 Apr 2022 14:27:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24FE4C002D
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 14:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11BCC4155C
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 14:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gacG0LUn1DOu for <iommu@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 14:27:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1842E4156A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 14:27:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g20so18639000edw.6
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m51cNS74FiKcfMwaHkcE4/8logZlIaN7nu3DxMWpYFk=;
 b=R29BxhkRm53cZToxZnIGPbkKoyKLg1qgnyCzPKA444ALfVoJ7nYD6hgEJrJI1YW1OR
 YX/0osV0xmbfAaHMBN4FWmW/YiPkteEVJeUUq6DGuHZJpuNxUiwkgwKhDt1Zhx5qzS1f
 6RD7YcDdD/3om+/nZjd5xrNMGXw1ow+dFZ3mZj7UB42LISvqUxunFX3cTsq8kIaxI7XH
 ZQiY12scA00wjkQYpdBJNrQb2H944Igr0xQ5LeLmDxMLt695g1H0YfwOXzjg4nrCaqp+
 CiFg9M+I+wL3zJiJXPqpzjkEFeb744eRQ8czq4nv+EwzFGMh6AfDUq5GsiXPsOFRKS0z
 rn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m51cNS74FiKcfMwaHkcE4/8logZlIaN7nu3DxMWpYFk=;
 b=5dsNXuUGhm55ZW48udBwNOxsNWoFXaavT/u2U2Kg5zaUcUi9oGJ844BQeE10Ul7W4u
 Mf18HGui+l4eNsQHsN7BZn33a8I4Jj4YsNAzGC1/TVP3UUOBRSf5WAZ2Gv3ev5PnPnN/
 Tn2EkrFzbRti8DDTN6rLO6n11r84LzgCLPnplrxb3tnk/jhtjekel29/ElrQZAuvT1K4
 zQepwRdGJey2pO7lE8Nd1N0FoZjht4WgIm5gKqYPWbchA1OvPbqEA/zoHEj8oVAzaUrv
 ZcXIKGcynoX+pzKMEZ4ziWramJ6ZMNNzj3UMdxwldieDkBl3/U45BaxJ0qVK3eY7iExh
 HIFg==
X-Gm-Message-State: AOAM5306jbo70ibkkRsIbqKA6Pr/lsHHLeUDHRpExVdIf4LD9G3BI2Eb
 gJWyG9kfaUISMNAvhO+Xd5Hvlg==
X-Google-Smtp-Source: ABdhPJyUG4cXI41631ctvg+/Z5UfjkEVnIEG1qY2UB6sVxyeDbyoRqzpV/Mr2gsARD3h7gAB8E9lnw==
X-Received: by 2002:a05:6402:430b:b0:425:f580:ec72 with SMTP id
 m11-20020a056402430b00b00425f580ec72mr1537433edc.194.1650896827296; 
 Mon, 25 Apr 2022 07:27:07 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170906590d00b006f39021e683sm1490192ejq.12.2022.04.25.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:06 -0700 (PDT)
Date: Mon, 25 Apr 2022 15:26:40 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
Message-ID: <YmavoKkVu+hd+x0M@myrica>
References: <YllADL6uMoLllzQo@fyu1.sc.intel.com> <YmA4pbgevqln/jSO@myrica>
 <tencent_76E043C4D1B6A21A5253579A61034107EB06@qq.com>
 <tencent_7477100F8A445C6CAFA8F13601A55134480A@qq.com>
 <YmJ/WA6KAQU/xJjA@myrica>
 <tencent_A4E83BA6071B2204B6F5D4E69A50D21C1A09@qq.com>
 <YmLOznyBF0f7COYT@myrica>
 <tencent_2922DAB6F3D5789A1CD3A21A843B4007ED09@qq.com>
 <Yman5hLomw9/c+bi@myrica>
 <76ec6342-0d7c-7c7b-c132-2892e4048fa1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76ec6342-0d7c-7c7b-c132-2892e4048fa1@intel.com>
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

On Mon, Apr 25, 2022 at 07:18:36AM -0700, Dave Hansen wrote:
> On 4/25/22 06:53, Jean-Philippe Brucker wrote:
> > On Sat, Apr 23, 2022 at 07:13:39PM +0800, zhangfei.gao@foxmail.com wrote:
> >>>> On 5.17
> >>>> fops_release is called automatically, as well as iommu_sva_unbind_device.
> >>>> On 5.18-rc1.
> >>>> fops_release is not called, have to manually call close(fd)
> >>> Right that's weird
> >> Looks it is caused by the fix patch, via mmget, which may add refcount of
> >> fd.
> > Yes indirectly I think: when the process mmaps the queue, mmap_region()
> > takes a reference to the uacce fd. That reference is released either by
> > explicit close() or munmap(), or by exit_mmap() (which is triggered by
> > mmput()). Since there is an mm->fd dependency, we cannot add a fd->mm
> > dependency, so no mmget()/mmput() in bind()/unbind().
> > 
> > I guess we should go back to refcounted PASIDs instead, to avoid freeing
> > them until unbind().
> 
> Yeah, this is a bit gnarly for -rc4.  Let's just make sure there's
> nothing else simple we can do.
> 
> How does the IOMMU hardware know that all activity to a given PASID is
> finished?  That activity should, today, be independent of an mm or a
> fd's lifetime.

In the case of uacce, it's tied to the fd lifetime: opening an accelerator
queue calls iommu_sva_bind_device(), which sets up the PASID context in
the IOMMU. Closing the queue calls iommu_sva_unbind_device() which
destroys the PASID context (after the device driver stopped all DMA for
this PASID).

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
