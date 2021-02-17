Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AD31D70E
	for <lists.iommu@lfdr.de>; Wed, 17 Feb 2021 10:38:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421276F569
	for <lists.iommu@lfdr.de>; Wed, 17 Feb 2021 09:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ynFDXwO4k9W for <lists.iommu@lfdr.de>;
	Wed, 17 Feb 2021 09:38:21 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id B12E76F4BA; Wed, 17 Feb 2021 09:38:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A7F6F4B8;
	Wed, 17 Feb 2021 09:38:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35CEBC013A;
	Wed, 17 Feb 2021 09:38:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3365EC013A
 for <iommu@lists.linux-foundation.org>; Wed, 17 Feb 2021 09:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 19A0E85F59
 for <iommu@lists.linux-foundation.org>; Wed, 17 Feb 2021 09:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXzzf1OCXGKX for <iommu@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 09:38:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 496A185F52
 for <iommu@lists.linux-foundation.org>; Wed, 17 Feb 2021 09:38:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u14so16645287wri.3
 for <iommu@lists.linux-foundation.org>; Wed, 17 Feb 2021 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E/Q0zJsuaggU5QB2u6YiyUvlNfydKAw6Pm4VsbOhWzQ=;
 b=KUjmskxuk6vWaykM1GsqTGjAhaKSaP08TsEhQIGIJPjJEUXNgXZHdnhPEpQIVhRf/E
 RP5Kcrz5Brgh+URT7+pcgeiMA5K7A7PWN5lgU6XFGAdwrbXpnQg1xwMdWQZdUfvCq6wg
 c2el7LEdwv81Fiuog4ajgtlfFAc2iZx3ZTkNtJwpLuyxrsyrXqnoTCnes3/jjwjPhhxI
 WjvdWOjHGqgTTbjYpwYzDES0xo+FiAT3oz9xzCR9uDAxEX+ZnIQh03Wgn3dE1jFt9bs3
 nU8aR9XXNP2Vizc5lpyUP/swpO4jywvOm+xDkQL5vBfruErnC9k+VlWxDXhGm5la0nxy
 uZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E/Q0zJsuaggU5QB2u6YiyUvlNfydKAw6Pm4VsbOhWzQ=;
 b=FERJAtnby8QmOHKz0x3aQirHX4VyludFcA3Vh2rUZkBwR8YYJ/VQSvhGDtLVIlnnfy
 JiqCDNIROb13LQmLuPhq/1P7/BlDacnphdTCH9E7NdCFjZ2mDeqdcLDXGLox8s1db9em
 K6utyLz9Y/FB3L7iBrYXC0BEdYvsbiLvPf6fDzYpcwZVFcZTigykE6vc9h68ItM6P/Wb
 L0b5WOQHhCfLaZkx1mXgUrLl2cLdd+RQRDzoKmMnVKz32SDJIxTPZOJ9PtaQO0gKIsll
 TeCWJGNJDe7W388b93pSUpKaGVB0sSBq5Yb+IGQzkdka89ECmyG/wOALXSVECQAY5q7k
 oy7Q==
X-Gm-Message-State: AOAM531cl3Gcxrg0D7hfWQ6axoWtWtEo/blUt7cvEp9CRXw4Hw/AHtdV
 Z7A8Zp0wGrvlnL0mrVTA7NuhOw==
X-Google-Smtp-Source: ABdhPJycae9ofTrdJiMsu1v+/HqpFVkEVSE2GObFXU2kRCVxV0//z9W8mX5TSbwmJtowhBIhgcYZwA==
X-Received: by 2002:adf:e805:: with SMTP id o5mr27988517wrm.227.1613554694814; 
 Wed, 17 Feb 2021 01:38:14 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u14sm3025603wro.10.2021.02.17.01.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 01:38:14 -0800 (PST)
Date: Wed, 17 Feb 2021 10:37:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Al Stone <ahs3@redhat.com>
Subject: Re: [EXTERNAL] Re: Question regarding VIOT proposal
Message-ID: <YCzj85YDWRxmrCHo@myrica>
References: <20201106135745.GB974750@myrica>
 <MW2PR2101MB11301F2185D1C9016310728E80F21@MW2PR2101MB1130.namprd21.prod.outlook.com>
 <20201203230127.GD4343@redhat.com>
 <20201204180924.GA1922896@myrica>
 <20201204201825.GG4343@redhat.com> <YBkYsSHGUfG91NoN@myrica>
 <20210202202713.GF702808@redhat.com> <YBpjAF3Q+NeJblE9@myrica>
 <20210204202524.GO702808@redhat.com>
 <20210216213103.GT702808@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216213103.GT702808@redhat.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>,
 Alexander Grest <Alexander.Grest@microsoft.com>,
 Yinghan Yang <Yinghan.Yang@microsoft.com>
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

On Tue, Feb 16, 2021 at 02:31:03PM -0700, Al Stone wrote:
> Would you believe last week's meeting was canceled, too?  Not sure
> why the chair/co-chair are doing this but I'm finding it a little
> frustrating.
> 
> We'll try again this week ... again, apologies for the delays.  I'd
> recommend going with the last version posted just so progress can be
> made.  The spec can always be fixed later.

Thanks, I'll send the acpica changes for review and follow with QEMU and
Linux patches. These things also take time so I might as well start in
parallel.

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
