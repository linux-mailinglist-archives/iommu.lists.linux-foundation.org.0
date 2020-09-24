Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01C276C09
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 10:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9CE6D82024;
	Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BI8xsazkDbVj; Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C6F680CDB;
	Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20954C0051;
	Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11FE8C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E05986A0E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9sqqy9RFKL6 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 452B4869C9
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:33:26 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id o8so3252961ejb.10
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jyXmkIgY0LNWFTzPLGPT01v9MPN/PKXL0sjKcC6NB5g=;
 b=CULJWZFlgtyrSKeuahx3NPP/IQeQHLWNP8sKhd/TwHs5cpEaqDxw+LVFhTKOm0yEmY
 MfRKM2j7Sg36BSoSSwKL7rvZfAM062viSliCHU57QOQnzPQN2ktici8ihBklwEWk++eL
 Ot6kNZ7vfkYyYTjHlPPusxYSKQSiR1nVKwbVCNowjDAaKoOBhiq1xS2vENWcXMdlm3xL
 ydtMMXz79lVvlL0gZOQMYSdGv8H2GZCjOQgPAoYGjR8p3unq0JmlAR3GPxS5evLUuZKY
 m3Dk4vu1WmwzEl2x6DKPnhByC+J3HO4PdOvZbOOcVw5AT9p/dK+u5XqWvop1s1ra1hT3
 ZKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jyXmkIgY0LNWFTzPLGPT01v9MPN/PKXL0sjKcC6NB5g=;
 b=Sgaf641a1j0NL8Cdkj0I7PEUi16KcDXw9/EDUMA5UtBFXUNNfUpZWZVwpoQoakDvsZ
 8SBFPCSC0tTIp+de08prIT6PfThtcHiWqEqXWcPBzbO9TvR/joXqr5kPymZito3gOyT9
 VLYV8ymKAB5F33TT8m8rKISHB7ndWfibb+LtcJfIvYxbOpjA0tMBoQIktj2GJBeVKwWH
 7Y1FwSqjtarEX90Q+mcx9JTUpWkNqvujxX/6SyUOZKMB6LA++DSV/wEEoNT2Jw0ylR7a
 8xzwslZGwrWkXmyUHlBwSIsHZG6tnBv6BOXdQOyuhbuUdCES2fKgmRApu3Clt7vVKDFK
 M8aw==
X-Gm-Message-State: AOAM532tBsFX432RvbHIA3b/b0qpHxjzaDTebC4FBB4WGw6lXvqF3aaW
 Wp/C1w39Ed7oq9fIZFvFyF9duA==
X-Google-Smtp-Source: ABdhPJxtcrA4yjr/ahtgkewCxLx0mpHJ/7gjeE+jRO7iJDqgqZNqa+39Vg+vRpg/TCfzV39dzZhP/Q==
X-Received: by 2002:a17:906:a1d4:: with SMTP id
 bx20mr3417412ejb.262.1600936404738; 
 Thu, 24 Sep 2020 01:33:24 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id a5sm2091593edb.9.2020.09.24.01.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 01:33:24 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:33:06 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 5/6] iommu/virtio: Support topology description in
 config space
Message-ID: <20200924083306.GB170808@myrica>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-6-jean-philippe@linaro.org>
 <a52f8a2e-3453-eadf-9761-fd92a20c20f5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a52f8a2e-3453-eadf-9761-fd92a20c20f5@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com, mst@redhat.com,
 linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 bhelgaas@google.com, jasowang@redhat.com
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

On Fri, Sep 04, 2020 at 06:05:35PM +0200, Auger Eric wrote:
> > +static inline int viommu_pci_find_capability(struct pci_dev *dev, u8 cfg_type,
> > +					     struct viommu_cap_config *cap)
> not sure the inline is useful here

No, I'll drop it

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
