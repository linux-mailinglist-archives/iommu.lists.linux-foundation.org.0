Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916C37BA49
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 12:24:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25896071D;
	Wed, 12 May 2021 10:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtDo6V4v9lcU; Wed, 12 May 2021 10:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21FE6060B;
	Wed, 12 May 2021 10:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9717FC0001;
	Wed, 12 May 2021 10:24:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F311C0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 10:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46154402ED
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 10:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w60W2YD7NWEH for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 10:24:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D24B9402E8
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 10:24:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a4so34232397ejk.1
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D5hbwLxFDNI5eCJ1EIHByvg5+72F3NmUyyX75vpDxZY=;
 b=sxtTbR1fRqaEwgYzNbx5fzx6gem73axRM0aRweqyX7Mdga9w+G4CWAy7FssbRTG73/
 Cl6Pg7ikFO9DV1HbR7nVr1u7qf7ExGU5a7TbOs9p3j5C7mmDkDfkvQsjksL1J8J+JAAe
 QdVqXaXeljUuwO3Bv5lxVvhgce6Y8vzF7EQOXw+yCdN/UVPbSlW6/GffBrYneJ27qYep
 jJQ0xky7kLMVG/Pgq0LMaFY1K7pabtiT+lYEHEQr7aX8AJ+SfY7FhISNigp5FXIsyuGI
 jOoGgp6FnCBMqQeZBZBl0gtUWetGJumS8yWW8oHlKW1HezL/321Hx+//C12zroitE1f0
 Yjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D5hbwLxFDNI5eCJ1EIHByvg5+72F3NmUyyX75vpDxZY=;
 b=MOlqJyDSTdB8mRmsE6Gb17nWdTOKJfFMOLMLm2jHD16B0xQbMcJ2kZcchJL7+Z2A+A
 lxiQi0ckLzHzzuLRVEdBlevDx+jdrhzXc2gvBDhw0a9alXBd8SqRJgSI6OL5Wd6pEQjK
 4YwdKqb07HmdQBZNIJGHcN/KflFW7Dvr6DLqc9IAo3eaOWzcnwELY4gIidGhkj5cXnT3
 nvN1irwDa9enIlnRXKZ1cu04es6goGsn9Jy7yJbhpnGpLgyrkCgaIUFPoYqHh5OS5G/F
 9yferTxYS4WwzgijQAu9wT2w1Tecr9gEJF96wvmCyULtqPtH+YN+bgRWlaSZM4dIx8Xi
 RF0w==
X-Gm-Message-State: AOAM5315VylNQaavy4yHS9R7aDfo2Wbdpi5e7xOPayOoHhrEx574hwjq
 ftpBG97ytydUL/b8zwPkOzFP3w==
X-Google-Smtp-Source: ABdhPJw/qvzNJC4HUtIWyY8rJmCv8CfFPERoCFAnqifvkhD3ocl8UdpbWAib8ErpdB5JILxmzdzsTw==
X-Received: by 2002:a17:906:b7d9:: with SMTP id
 fy25mr18736304ejb.156.1620815084018; 
 Wed, 12 May 2021 03:24:44 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c5sm11674591eds.94.2021.05.12.03.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:24:43 -0700 (PDT)
Date: Wed, 12 May 2021 12:24:26 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v4 2/2] iommu/sva: Remove mm parameter from SVA bind API
Message-ID: <YJus2jvUBfx6ZSVf@myrica>
References: <1620653108-44901-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1620653108-44901-3-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620653108-44901-3-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: vkoul@kernel.org, "Tian, Kevin" <kevin.tian@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.com>
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

On Mon, May 10, 2021 at 06:25:08AM -0700, Jacob Pan wrote:
> The mm parameter in iommu_sva_bind_device() is intended for privileged
> process perform bind() on behalf of other processes. This use case has
> yet to be materialized, let alone potential security implications of
> adding kernel hooks without explicit user consent.
> In addition, with the agreement that IOASID allocation shall be subject
> cgroup limit. It will be inline with misc cgroup proposal if IOASID
> allocation as part of the SVA bind is limited to the current task.
> 
> Link: https://lore.kernel.org/linux-iommu/20210303160205.151d114e@jacob-builder/
> Link: https://lore.kernel.org/linux-iommu/YFhiMLR35WWMW%2FHu@myrica/
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

I'm not particularly enthusiastic about this change, because restoring the
mm parameter will be difficult after IOMMU drivers start assuming
everything is on current. Regardless, it looks correct and makes my life
easier (and lightens my test suite quite a bit).

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
