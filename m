Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE23722B3
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 23:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E03C40637;
	Mon,  3 May 2021 21:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ql95tSWjJ5GB; Mon,  3 May 2021 21:54:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530F74063A;
	Mon,  3 May 2021 21:54:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1542DC0001;
	Mon,  3 May 2021 21:54:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6CDDC0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2368400F1
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QxeoFs_5QQX for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 21:54:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F7ED400E9
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 21:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBi/OOChs5l4gDd1iMndcau+ma+l15riW82pUTVao5cLyhos5lGs/1r8sGpY3ErCc9beW37/Xyz9DYAiwe3NLLvT+OmaU07nLZobZINPayamOtjZ6Z9w57tsSTcLJPygmjOArFKrduS/nYk9bFdXRKYxwhfRhLx5UzQeFXJ2P/z9fF8WcnyVArC+Zpt7htOM4Hh0Dl7d7dbtTEIHK9Y2rW0XNc3y1/KiBaUwQr46Rpssy0DtTp2sTDt81N7aH536KUviV6BolQIbrwuRvcB4xMIjH9qVnAzTsSDEPaZCAnm3ClJfOLgoiHx41P9vxOAGSDWRvIWzxSSN/8KrVPLcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/eXQHoHLkCUUS8AnR3Rc3m6o8iYd8IlCJLPkc/Ajng=;
 b=P1Gv3zUihlZPr3vPZZm8QRQEOv+FHag7tD/0mAdT1EYHKjPNi54rmTMARg6P40PmmKEGPjIaMaxLyh7zYVUNTH3iXdK8Vwxym/Z1uZK1FkoVpsiO59aDmWKKWcwMe7fU9nEe5nKRhWA2j2Ytb9U9YtrTRMiZ1YSNkIDfyrZKCvgsP96d+FMymHnRoQwkP7O8ChsGJDuCbvupNoM4Pl2kvFLK31Tkr9YeCW3ca3HKFce29ZFr75a3L02IJbEOxtmP/vxOU/9BvwKfQewSjTnHRZ4JjnzMT+fgUr85T4e+xxUeRfcFvKvHrSJsHI+jaLcJXFuvRznaKY1DrjbacNSlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=raithlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/eXQHoHLkCUUS8AnR3Rc3m6o8iYd8IlCJLPkc/Ajng=;
 b=VlrE+djMP0DJ2UcKe4tJRFK8dcCSnzj54Xxn4k6pG+/bDRl7QA1inrF3ofUT32GVxw5XB0wBVz7EgdYjd8G5Gncyfc9PQJPGZZlG5+9pt3dUB3QKbOm0qoclG7Nj6LZEo70A3cJAg2EQeWCOilw5AJ1oZiI9OOkX34G8DxUsyxLEUTlEPJTTlgSwtzy8e5IHJVoeaAHmAc4e2KNmYYpWDEjbEx7UQkaw5ghRmMYZCvMHagWu93vq0LxpfAFKCvGzxsbh176/s3lxQmiWZEvt5bzCNONyAIJ60T2UhEIhF3UfH4F14sfGcwTiToZ33u+U6SjCDgIjlMp20r48yzr+TA==
Received: from MW4PR04CA0387.namprd04.prod.outlook.com (2603:10b6:303:81::32)
 by CH2PR12MB3704.namprd12.prod.outlook.com (2603:10b6:610:21::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.42; Mon, 3 May
 2021 21:54:28 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::f3) by MW4PR04CA0387.outlook.office365.com
 (2603:10b6:303:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 21:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; raithlin.com; dkim=none (message not signed)
 header.d=none;raithlin.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 21:54:27 +0000
Received: from [10.2.50.162] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 3 May
 2021 21:54:27 +0000
Subject: Re: [PATCH 04/16] PCI/P2PDMA: Refactor pci_p2pdma_map_type() to take
 pagmap and device
To: Logan Gunthorpe <logang@deltatee.com>, <linux-kernel@vger.kernel.org>,
 <linux-nvme@lists.infradead.org>, <linux-block@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-mm@kvack.org>,
 <iommu@lists.linux-foundation.org>
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-5-logang@deltatee.com>
 <ce04d398-e4a1-b3aa-2a4e-b1b868470144@nvidia.com>
 <f719ba91-07ba-c703-2dc9-32cb1214e9c0@deltatee.com>
 <f07f0ca7-9772-5b3b-4cea-9defcefaaf8b@nvidia.com>
 <ab0e4256-79c9-c181-5aec-f6869a92a80c@deltatee.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d4f19947-d4c1-451b-311f-9e31a4ded6fc@nvidia.com>
Date: Mon, 3 May 2021 14:54:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ab0e4256-79c9-c181-5aec-f6869a92a80c@deltatee.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c358ef6-f987-49c5-90cd-08d90e7e05f3
X-MS-TrafficTypeDiagnostic: CH2PR12MB3704:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3704AD979A1AB5D9AE5D900DA85B9@CH2PR12MB3704.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BdVOjqbOHr6LL68rz0bWz3Wri8f+WsOjQdc4gIp/gYwWFzHx7zEC1Za463tQIxMkpOCRpmMi0QzZr3NfPIMtIZgQtZbguCGozneBgOCUk75yHpPJEidHlQAYF9Bw5YEi6jiUpKPOCxglH6TFYZQWNJMJ1n/AJlhKTjz3nIE/xjV5QGlZExlJqLUXuaH7vRzDIsbLmwvSaC25Uz7Jpgii6rSWzXTSokTUCzxx6IWaXGckq2z1Um0ZrCI5Oj+xRs5GJG74Uhj9nJdUg8GT4LOfKwISZYDNfFpMtWHAJrMXVhFM7IsliMDVkv06z+jmGiiZL3yWu2ISL+3v98JBSvne4/jIlyIhZv/vZdBlVHU2fr/WS9fBPqLGg7ybZsOEMhtSyZ7K+cQQy0t+1huj04dvLuZolRIFuDXbBDYRYJVh+0iBX5HvXQQ5W+bse1ksEWpO57wuHwoJC29sSTXOMRitaN7L52AxYpuKdd79Gwm6IyhwnazELMXJRsx/IE+vS+m0ggeg9gl/xG89T0QfweuukZGScYDOo0aTg/VJStsJnrqAStJtOVHP6d1L/23JiSV1noRBexPrzM6IlLrtkuujNl0/r48/dpLDXHRWYWVYdUwTdDP7Rc2OowMq9t3atk6Oc3dj5UXBHNYF8XFrgDCL6JH14wuygA10u/EBwU6vyXoSuHICikXhB1++Hy9PduRCtN8fZoHykKBx/fxMG4PQg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(36756003)(110136005)(316002)(336012)(31686004)(356005)(16526019)(7636003)(53546011)(83380400001)(8936002)(70206006)(5660300002)(54906003)(16576012)(70586007)(47076005)(478600001)(31696002)(82310400003)(7416002)(426003)(186003)(2906002)(86362001)(4326008)(26005)(36906005)(8676002)(2616005)(82740400003)(36860700001)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 21:54:27.6943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c358ef6-f987-49c5-90cd-08d90e7e05f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3704
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Ekstrand <jason@jlekstrand.net>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 5/3/21 11:56 AM, Logan Gunthorpe wrote:
...
>> IMHO, it is better to have all of the pci_*() functions dealing with pci_dev
>> instead of dev, but it is also true that this is a larger change, so I
>> won't press the point too hard right now.
> 
> As a general rule, I'd agree with you. However, it's not good to blindly
> follow the rule when there might be good reasons to do it differently.
> 
> In this case, the caller doesn't have PCI devices. The nvme fabrics code
> has a number of block devices and an RDMA device. It doesn't even know
> if these devices are backed by PCI devices and it doesn't have a direct
> path to obtain the pci_dev.
> 
> Each struct device, might be turned into a pci_dev using the static
> function find_parent_pci_dev(). If any device is not a PCI device then
> we reject the P2PDMA transaction as not supported. Pushing the
> find_parent_pci_dev() logic into the callers is, IMO, just asking the
> callers to replicate a bunch of logic it shouldn't even be aware of
> creating messier code as a result.
> 

I guess my main concern here is that there are these pci*() functions
that somehow want to pass around struct device. If a layer is carefully
named throughout with pci in the function names, then something is still
misaligned.  This can happen over time, of course. But the really best
patchsets try to avoid or mitigate the effect, by keeping names and
functionality carefully aligned.

Anyway, I've bugged you enough, I should just wait and see what the next
round looks like, at this point. :)

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
