Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5619AD32
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 15:55:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E4AC620451;
	Wed,  1 Apr 2020 13:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQQCqrgLe-TS; Wed,  1 Apr 2020 13:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 22A782044E;
	Wed,  1 Apr 2020 13:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 177A3C089F;
	Wed,  1 Apr 2020 13:55:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1B1EC089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8F4FB20447
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q+kzJAN5-4zE for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:55:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E30D20028
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:55:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h15so112467wrx.9
 for <iommu@lists.linux-foundation.org>; Wed, 01 Apr 2020 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BokcsbFHdrrz/l4PyjTUoW+8uB/MqRMjCTweSlnNCdg=;
 b=Hcyn6fKHUAWfyXHU0AQI42LD9l04dXQT2av71U4PkGbjP1d8X5ejQCIr6m6I8zply1
 y8ng/jzsrvOEIlv8YqJZzMFhcwDwbkuyqlz2yvuRbQVyaqUGswaO9CNCy9IrzGWiN8hT
 cFE+955zBtH6yc/aEP2P52gHsEhgURQjFPIZpzhw3Hze/Fc5q/uyfnDn8FSctAt65FG9
 9kM1BSabVwbx+rvRSKTrXaLxMRAyfQNDJ23fZKm86OfAiSB69A6ywoCoKMJHavK0GPO/
 y6FOyxUw98OPpXYcbhlSDeKwSp23hkf8OsdgmqtEUQoqQguBvFBe70cMzXxajkFcMHGT
 w23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BokcsbFHdrrz/l4PyjTUoW+8uB/MqRMjCTweSlnNCdg=;
 b=ZjqpEQmHQt6ot8jfygly3HpzFiqCcdL0JVZnY6euEfhNUouAn0VhANrKWh8WkHByaQ
 x50j8tlYuT553aBt2whQsaRV9ciYry/1c2wn2Zn0bkGxEOlZ9vI7W0IoukYQ/EtBd5qe
 udtsXAcIlxuGptxYJfhJMcYOGVtGm15a8czqG1jMq8Ezv03TYLWrbDuqXTnc3jvlfMrY
 tVoyPnE7CcXaK30k3XfNulBKTG3ji2ZC6P9mraeqmGrhlmEtwQs97uN6D0F5pSrYG666
 CuUjZCheFxf21uPap8UbA1MPrQ+7x9K7O7CwQMugPqw4ZmynO6vuteAI4dI/jn4wavkI
 rMng==
X-Gm-Message-State: ANhLgQ3fZpo4LryS0SBRkIcY9tu5zkCKDXYLBmB7obNMX8uhoEhbl/pK
 Aj/BiBHiAiAXPdp7Ap08Nca1MA==
X-Google-Smtp-Source: ADFU+vtmh9pjwAtzFVJ9AOztFnbZs+VXIuHpNaBbP7+Bz5tpaP97qcOdEJJmKnjKxhSpeN/c6TG6Bw==
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr25721435wrh.7.1585749333948; 
 Wed, 01 Apr 2020 06:55:33 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id c189sm2853560wmd.12.2020.04.01.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 06:55:33 -0700 (PDT)
Date: Wed, 1 Apr 2020 15:55:25 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 06/10] iommu/ioasid: Convert to set aware allocations
Message-ID: <20200401135525.GG882512@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-7-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585158931-1825-7-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Mar 25, 2020 at 10:55:27AM -0700, Jacob Pan wrote:
> The current ioasid_alloc function takes a token/ioasid_set then record it
> on the IOASID being allocated. There is no alloc/free on the ioasid_set.
> 
> With the IOASID set APIs, callers must allocate an ioasid_set before
> allocate IOASIDs within the set. Quota and other ioasid_set level
> activities can then be enforced.
> 
> This patch converts existing API to the new ioasid_set model.
> 
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

[...]

> @@ -379,6 +391,9 @@ ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
>  	}
>  	data->id = id;
>  
> +	/* Store IOASID in the per set data */
> +	xa_store(&sdata->xa, id, data, GFP_KERNEL);

I couldn't figure out why you're maintaining an additional xarray for each
set. We're already storing that data in active_allocator->xa, why the
duplication?  If it's for the gPASID -> hPASID translation mentioned by
the cover letter, maybe you could add this xa when introducing that
change?

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
